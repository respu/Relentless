using Newtonsoft.Json;
using Relentless.API;
using Relentless.Configuration;
using Relentless.Cryptography;
using Relentless.Database;
using Relentless.Global;
using System;
using System.Text;
using System.Threading;
using System.Security.Cryptography;

namespace Relentless.Network
{
    public class SignInHandler
    {
        public static void BattleSignIn(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("BattleSignIn");

            BattleSignIn battleSignIn = JsonConvert.DeserializeObject<BattleSignIn>(jsonPacketData);

            if (InternalSignIn(client, battleSignIn.email, battleSignIn.password))
            {
                Battle battle = BattleAPI.GetBattle(client.account.username);

                if (!PlayerAPI.IsOnline(battle.opponent))
                {
                    while (!PlayerAPI.IsOnline(battle.opponent))
                    {
                        Thread.Sleep(1);
                    }

                    BattleSignInFinish(client);
                }
                else
                {
                    BattleSignInFinish(client);
                }
            }
        }

        private static void BattleSignInFinish(Client client)
        {
            Battle battle = BattleAPI.GetBattle(client.account.username);

            if (battle.phase == null)
            {
                battle.phase = "Init";

                BattleHandler.GameInfo(client);
            }
            else
            {
                BattleAPI.Message(battle, "Scrolls", client.account.username + " has reconnected!");
                BattleHandler.GameInfo(client);
            }
        }

        public static void Reconnect(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("Reconnect");

            Reconnect reconnect = JsonConvert.DeserializeObject<Reconnect>(jsonPacketData);

            if (InternalSignIn(client, reconnect.email, reconnect.password))
            {
                OkMessage okMessage = new OkMessage();
                okMessage.op = "Reconnect";

                client.Send(okMessage);

                ProfileHandler.ProfileInfo(client);
                ProfileHandler.ProfileDataInfo(client);
            }
        }

        public static void SignIn(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("SignIn");

            SignIn signIn = JsonConvert.DeserializeObject<SignIn>(jsonPacketData);

            if (InternalSignIn(client, signIn.email, signIn.password))
            {
                OkMessage okMessage = new OkMessage();
                okMessage.op = "SignIn";

                client.Send(okMessage);

                ProfileHandler.ProfileInfo(client);
                ProfileHandler.ProfileDataInfo(client);
            }
        }

        private static bool InternalSignIn(Client client, string encryptedEmail, string encryptedPassword)
        {
            if (Variables.sessionMap.Count >= ConfigReader.serverMaxPlayers)
            {
                FailMessage failMessage = new FailMessage();
                failMessage.op   = "SignIn";
                failMessage.info = "Server is at currently full! Max capacity is " + ConfigReader.serverMaxPlayers + " players.";

                client.Send(failMessage);

                return false;
            }
            else
            {
                int signinStatus = 0;
                string email     = Crypt.RSA.Decrypt(encryptedEmail);
                string password  = Crypt.RSA.Decrypt(encryptedPassword);

                SQLResult accountResult = DB.Database.Select(client.connection, true, false, "SELECT * FROM account WHERE email = ?", email);

                if (accountResult.Count != 0)
                {
                    int accountId             = accountResult.Read<int>   (0, "guid");
                    string username           = accountResult.Read<string>(0, "username");
                    string remotePasswordHash = accountResult.Read<string>(0, "password");
                    bool alreadySignedIn      = accountResult.Read<bool>  (0, "signedIn");

                    string localPasswordHash = HexString(new SHA1CryptoServiceProvider().ComputeHash(Encoding.UTF8.GetBytes(email + "|" + password)));

                    if (localPasswordHash == remotePasswordHash)
                    {
                        if (alreadySignedIn == true)
                        {
                            signinStatus = -2;
                        }
                        else
                        {
                            SQLResult banResult = DB.Database.Select(client.connection, false, false, "SELECT * FROM account_bans WHERE guid = ?", accountId);

                            if (banResult.Count != 0)
                            {
                                signinStatus = -1;
                            }
                            else
                            {
                                signinStatus = 1;
                            }
                        }
                    }
                }

                if (signinStatus <= 0)
                {
                    FailMessage failMessage = new FailMessage();
                    failMessage.op = "SignIn";

                    switch (signinStatus)
                    {
                        case -2:
                            {
                                failMessage.info = "This account is already logged in!";
                                break;
                            }
                        case -1:
                            {
                                failMessage.info = "This account is banned!";
                                break;
                            }
                        case 0:
                            {
                                failMessage.info = "Incorrect username or password!";
                                break;
                            }
                    }

                    client.Send(failMessage);
                    client.connection.Close();

                    return false;
                }
                else
                {
                    client.account.id               = accountResult.Read<int>   (0, "guid").ToString();
                    client.account.email            = accountResult.Read<string>(0, "email");
                    client.account.username         = accountResult.Read<string>(0, "username");
                    client.account.acceptChallenges = true;
                    client.account.acceptTrades     = true;

                    switch (accountResult.Read<int>(0, "adminRole"))
                    {
                        case 0: { client.account.adminRole = "None";      break; }
                        case 1: { client.account.adminRole = "Moderator"; break; }
                        case 2: { client.account.adminRole = "Mojang";    break; }
                    }

                    SQLResult profileDataResult = DB.Database.Select(client.connection, false, false, "SELECT * FROM account_data WHERE guid = ?", client.account.id);
                    client.account.gold                   = profileDataResult.Read<int>(0, "gold");
                    client.account.shards                 = profileDataResult.Read<int>(0, "shards");
                    client.account.gamesPlayed            = profileDataResult.Read<int>(0, "gamesPlayed");
                    client.account.gamesWon               = profileDataResult.Read<int>(0, "gamesWon");
                    client.account.gamesSurrendered       = profileDataResult.Read<int>(0, "gamesSurrendered");
                    client.account.selectedPreconstructed = profileDataResult.Read<int>(0, "selectedPreconstructed");

                    SQLResult avatarResult = DB.Database.Select(client.connection, false, false, "SELECT * FROM account_avatar WHERE guid = ?", client.account.id);
                    client.account.avatar.head     = avatarResult.Read<int>(0, "head");
                    client.account.avatar.body     = avatarResult.Read<int>(0, "body");
                    client.account.avatar.leg      = avatarResult.Read<int>(0, "leg");
                    client.account.avatar.armBack  = avatarResult.Read<int>(0, "armBack");
                    client.account.avatar.armFront = avatarResult.Read<int>(0, "armFront");

                    SQLResult cardResult = DB.Database.Select(client.connection, false, false, "SELECT * FROM account_cards WHERE guid = ?", client.account.id);

                    for (int i = 0; i < cardResult.Count; i++)
                    {
                        Card card = new Card();
                        card.id       = cardResult.Read<int>(i, "id");
                        card.typeId   = cardResult.Read<int>(i, "typeId");
                        card.level    = cardResult.Read<int>(i, "level");
                        card.tradable = cardResult.Read<int>(i, "tradable") == 1;
                        card.isToken  = cardResult.Read<int>(i, "isToken") == 1;

                        client.account.cardMap.Add(card.id, card);
                    }

                    PlayerAPI.UpdateScrollTypeCount(client);

                    SQLResult deckResult = DB.Database.Select(client.connection, false, false, "SELECT * FROM account_decks WHERE guid = ?", client.account.id);

                    for (int i = 0; i < deckResult.Count; i++)
                    {
                        Deck deck = new Deck();
                        deck.name      = deckResult.Read<string>(i, "name");
                        deck.timestamp = deckResult.Read<long>  (i, "timestamp");
                        deck.metadata  = deckResult.Read<string>(i, "metadata");
                        deck.valid     = deckResult.Read<int>   (i, "valid") == 1;

                        foreach (string resource in deckResult.Read<string>(i, "resources").Split('|'))
                        {
                            deck.resources.Add(resource);
                        }

                        foreach (string cardId in deckResult.Read<string>(i, "cards").Split('|'))
                        {
                            int iCardId = Convert.ToInt16(cardId);

                            if (CardAPI.Exists(client, iCardId))
                            {
                                deck.cards.Add(CardAPI.GetCard(client, iCardId));
                            }
                        }

                        client.account.deckMap.Add(deck.name, deck);
                    }

                    Variables.sessionMap.Add(client.account.username, client);

                    int lastId;
                    DB.Database.Execute(client.connection, out lastId, false, false, "UPDATE account SET signedIn = 1 WHERE guid = ?", client.account.id);

                    client.account.authenticated = true;
                    client.connection.Close();

                    return true;
                }
            }
        }

        private static string HexString(byte[] byteArray)
        {
            StringBuilder hexString = new StringBuilder(byteArray.Length * 2);

            foreach (byte singleByte in byteArray)
            {
                hexString.AppendFormat("{0:x2}", singleByte);
            }

            return hexString.ToString();
        }
    }
}
