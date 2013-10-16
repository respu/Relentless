using Newtonsoft.Json;
using Relentless.API;
using Relentless.Database;
using Relentless.Global;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class ProfileHandler
    {
        public static void AvatarSave(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("AvatarSave");

            AvatarSave avatarSave = JsonConvert.DeserializeObject<AvatarSave>(jsonPacketData);

            client.account.avatar.head     = avatarSave.head;
            client.account.avatar.body     = avatarSave.body;
            client.account.avatar.leg      = avatarSave.leg;
            client.account.avatar.armBack  = avatarSave.armBack;
            client.account.avatar.armFront = avatarSave.armFront;

            if (Variables.avatarTypeMap.ContainsKey(avatarSave.head) && Variables.avatarTypeMap.ContainsKey(avatarSave.body) && Variables.avatarTypeMap.ContainsKey(avatarSave.leg) && 
                    Variables.avatarTypeMap.ContainsKey(avatarSave.armBack) && Variables.avatarTypeMap.ContainsKey(avatarSave.armFront))
            {
                DB.Database.Execute(client.connection, true, true, "UPDATE account_avatar SET head = ?, body = ?, leg = ?, armBack = ?, armFront = ? WHERE guid = ?",
                    avatarSave.head, avatarSave.body, avatarSave.leg, avatarSave.armBack, avatarSave.armFront, client.account.id);
            }
            else
            {
                Console.WriteLine("{0} tried to save an avatar with invalid avatar type(s)!", client.account.username);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }
        
        public static void ProfileDataInfo(Client client)
        {
            client.packetMap.Remove("ProfileDataInfo");

            ProfileDataInfo profileDataInfo = new ProfileDataInfo();
            profileDataInfo.profileData.gold   = client.account.gold;
            profileDataInfo.profileData.shards = client.account.shards;
            profileDataInfo.profileData.rating = 0;

            if (client.account.selectedPreconstructed != 0)
            {
                profileDataInfo.profileData.selectedPreconstructed = client.account.selectedPreconstructed;
            }

            client.Send(profileDataInfo);
        }

        public static void ProfileInfo(Client client)
        {
            client.packetMap.Remove("ProfileInfo");

            ProfileInfo profileInfo = new ProfileInfo();
            profileInfo.profile.id               = client.account.id;
            profileInfo.profile.userUuid         = ""; //Note: Unsure what exactly the userUuid does or how it is generated
            profileInfo.profile.name             = client.account.username;
            profileInfo.profile.acceptChallenges = client.account.acceptChallenges;
            profileInfo.profile.acceptTrades     = client.account.acceptTrades;
            profileInfo.profile.adminRole        = client.account.adminRole;
            profileInfo.profile.userType         = "Beta";

            client.Send(profileInfo);
        }

        public static void ProfilePageInfo(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("ProfilePageInfo");

            ProfilePageInfo profilePageInfoClient = JsonConvert.DeserializeObject<ProfilePageInfo>(jsonPacketData);
            ProfilePageInfo profilePageInfoServer = new ProfilePageInfo();

            if (profilePageInfoClient.id != null)
            {
                Client remoteSession = PlayerAPI.GetSession(profilePageInfoClient.id, true);

                if (remoteSession != null)
                {
                    profilePageInfoServer.name             = remoteSession.account.username;
                    profilePageInfoServer.gold             = remoteSession.account.gold;
                    profilePageInfoServer.rating           = 0;
                    profilePageInfoServer.gamesPlayed      = remoteSession.account.gamesPlayed;
                    profilePageInfoServer.gamesWon         = remoteSession.account.gamesWon;
                    profilePageInfoServer.gamesSurrendered = remoteSession.account.gamesSurrendered;
                    profilePageInfoServer.ranking          = 0;
                    profilePageInfoServer.scrollsCommon    = remoteSession.account.cardTypeCount.common;
                    profilePageInfoServer.scrollsUncommon  = remoteSession.account.cardTypeCount.uncommon;
                    profilePageInfoServer.scrollsRare      = remoteSession.account.cardTypeCount.rare;
                    profilePageInfoServer.lastGamePlayed   = "Never";
                    profilePageInfoServer.avatar.profileId = remoteSession.account.id;
                    profilePageInfoServer.avatar.head      = remoteSession.account.avatar.head;
                    profilePageInfoServer.avatar.body      = remoteSession.account.avatar.body;
                    profilePageInfoServer.avatar.leg       = remoteSession.account.avatar.leg;
                    profilePageInfoServer.avatar.armBack   = remoteSession.account.avatar.armBack;
                    profilePageInfoServer.avatar.armFront  = remoteSession.account.avatar.armFront;
                }
            }
            else
            {
                profilePageInfoServer.name             = client.account.username;
                profilePageInfoServer.gold             = client.account.gold;
                profilePageInfoServer.rating           = 0;
                profilePageInfoServer.gamesPlayed      = client.account.gamesPlayed;
                profilePageInfoServer.gamesWon         = client.account.gamesWon;
                profilePageInfoServer.gamesSurrendered = client.account.gamesSurrendered;
                profilePageInfoServer.ranking          = 0;
                profilePageInfoServer.scrollsCommon    = client.account.cardTypeCount.common;
                profilePageInfoServer.scrollsUncommon  = client.account.cardTypeCount.uncommon;
                profilePageInfoServer.scrollsRare      = client.account.cardTypeCount.rare;
                profilePageInfoServer.lastGamePlayed   = "Never";
                profilePageInfoServer.avatar.profileId = client.account.id;
                profilePageInfoServer.avatar.head      = client.account.avatar.head;
                profilePageInfoServer.avatar.body      = client.account.avatar.body;
                profilePageInfoServer.avatar.leg       = client.account.avatar.leg;
                profilePageInfoServer.avatar.armBack   = client.account.avatar.armBack;
                profilePageInfoServer.avatar.armFront  = client.account.avatar.armFront;
            }

            client.Send(profilePageInfoServer);
        }

        public static void SelectPreconstructed(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("SelectPreconstructed");

            string cards   = "";
            int resourceId = 0;

            SelectPreconstructed selectPreconstructed = JsonConvert.DeserializeObject<SelectPreconstructed>(jsonPacketData);

            Deck deck = new Deck();
            deck.name      = selectPreconstructed.resourceType.Substring(0, 1) + selectPreconstructed.resourceType.ToLower().Remove(0, 1) + " Preconstructed";
            deck.timestamp = DateTime.Now.Ticks;
            deck.metadata  = "";
            deck.valid     = true;

            deck.resources.Add(selectPreconstructed.resourceType);

            client.connection.Open();

            List<int> cardTypeList = Variables.deckTypeMap[selectPreconstructed.resourceType];

            foreach (int cardType in cardTypeList)
            {
                DB.Database.Execute(client.connection, false, false, "INSERT INTO account_cards VALUES (0, ?, ?, 0, 0, 0);", client.account.id, cardType);

                cards += DB.Database.lastId + "|";

                Card card = new Card();
                card.id       = DB.Database.lastId;
                card.typeId   = cardType;
                card.tradable = false;
                card.isToken  = false;
                card.level    = 0;

                deck.cards.Add(card);
                client.account.cardMap.Add(card.id, card);
            }

            DB.Database.Execute(client.connection, false, false, "INSERT INTO account_decks VALUES (0, ?, ?, ?, ?, \"\", ?, 1);", client.account.id, deck.name, selectPreconstructed.resourceType, deck.timestamp, cards.TrimEnd('|'));

            switch (selectPreconstructed.resourceType)
            {
                case "DECAY":  { resourceId = 4; break; }
                case "ENERGY": { resourceId = 1; break; }
                case "GROWTH": { resourceId = 2; break; }
                case "ORDER":  { resourceId = 3; break; }
            }

            DB.Database.Execute(client.connection, false, true, "UPDATE account_data SET selectedPreconstructed = ? WHERE guid = ?", resourceId, client.account.id);

            client.account.deckMap.Add(deck.name, deck);

            OkMessage okMessage = new OkMessage();
            okMessage.op = "SelectPreconstructed";

            client.Send(okMessage);
        }
    }
}
