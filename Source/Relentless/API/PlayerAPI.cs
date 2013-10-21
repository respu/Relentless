using Relentless.Database;
using Relentless.Global;
using Relentless.Network;
using System.Collections.Generic;

namespace Relentless.API
{
    public class PlayerAPI
    {
        public static Client GetSession(string identifier, bool isId)
        {
            if (isId == false)
            {
                return Variables.sessionMap[identifier];
            }
            else
            {
                foreach (var session in Variables.sessionMap)
                {
                    if (session.Value.account.id == identifier)
                    {
                        return session.Value;
                    }
                }
            }

            return null;
        }

        public static void IncreaseGold(Client client, int amount)
        {
            client.account.gold += amount;

            int lastId;
            DB.Database.Execute(client.connection, out lastId, true, true, "UPDATE account_data SET gold = ? WHERE guid = ?", client.account.gold, client.account.id);
        }

        public static bool IsOnline(string name)
        {
            return Variables.sessionMap.ContainsKey(name);
        }

        public static void KickPlayer(Client client, string reason)
        {
            FailMessage failMessage = new FailMessage();
            failMessage.op   = "Reconnect";
            failMessage.info = reason;

            client.Send(failMessage);

            FailMessage infoFailMessage = new FailMessage();
            infoFailMessage.info = reason;

            client.Send(infoFailMessage);

            Variables.sessionMap.Remove(client.account.username);
            client.account = new Account();   
        }

        public static void RemoveGold(Client client, int amount)
        {
            client.account.gold -= amount;

            int lastId;
            DB.Database.Execute(client.connection, out lastId, true, true, "UPDATE account_data SET gold = ? WHERE guid = ?", client.account.gold, client.account.id);
        }

        public static void RemoveShards(Client client, int amount)
        {
            client.account.shards -= amount;

            int lastId;
            DB.Database.Execute(client.connection, out lastId, true, true, "UPDATE account_data SET shards = ? WHERE guid = ?", client.account.shards, client.account.id);
        }

        public static void UpdateScrollTypeCount(Client client)
        {
            client.account.cardTypeCount.common   = 0;
            client.account.cardTypeCount.uncommon = 0;
            client.account.cardTypeCount.rare     = 0;

            foreach (KeyValuePair<int, Card> card in client.account.cardMap)
            {
                switch (CardAPI.GetCardType(card.Value.typeId).rarity)
                {
                    case 0: { client.account.cardTypeCount.common++; break; }
                    case 1: { client.account.cardTypeCount.uncommon++; break; }
                    case 2: { client.account.cardTypeCount.rare++; break; }
                }
            }
        }

        public static User UserInfo(Client client)
        {
            User user = new User();
            user.id               = client.account.id;
            user.userUuid         = ""; //Note: Unsure what exactly the userUuid does or how it is generated
            user.name             = client.account.username;
            user.acceptChallenges = client.account.acceptChallenges;
            user.acceptTrades     = client.account.acceptTrades;
            user.adminRole        = client.account.adminRole;
            user.userType         = "Beta";

            return user;
        }
    }
}
