using Relentless.API;
using Relentless.Configuration;
using Relentless.Database;
using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;

namespace Relentless
{
    public class Initialise
    {
        public static void Assets()
        {
            Console.WriteLine("\nLoading Assets...");

            SQLResult avatarTypeResult = DB.Database.Select(Variables.connection, false, false, "SELECT * FROM avatar_types");

            for (int i = 0; i < avatarTypeResult.Count; i++)
            {
                AvatarType avatarType = new AvatarType();
                avatarType.id       = avatarTypeResult.Read<int>   (i, "id");
                avatarType.type     = avatarTypeResult.Read<string>(i, "type");
                avatarType.part     = avatarTypeResult.Read<string>(i, "part");
                avatarType.filename = avatarTypeResult.Read<string>(i, "filename");
                avatarType.set      = avatarTypeResult.Read<string>(i, "set");

                Variables.avatarTypeMap.Add(avatarType.id, avatarType);
            }

            Console.WriteLine("Avatar Types   - Loaded {0}", Variables.avatarTypeMap.Count);

            SQLResult cardTypeResult = DB.Database.Select(Variables.connection, false, false, "SELECT * FROM card_types");

            for (int i = 0; i < cardTypeResult.Count; i++)
            {
                CardType cardType = new CardType();
                cardType.id                    = cardTypeResult.Read<int>   (i, "id");
                cardType.kind                  = cardTypeResult.Read<string>(i, "kind");
                cardType.name                  = cardTypeResult.Read<string>(i, "name");
                cardType.description           = cardTypeResult.Read<string>(i, "description");
                cardType.flavor                = cardTypeResult.Read<string>(i, "flavor");
                cardType.subTypesStr           = cardTypeResult.Read<string>(i, "subTypesStr");
                cardType.rarity                = cardTypeResult.Read<int>   (i, "rarity");
                cardType.hp                    = cardTypeResult.Read<int>   (i, "hp");
                cardType.ap                    = cardTypeResult.Read<int>   (i, "ap");
                cardType.ac                    = cardTypeResult.Read<int>   (i, "ac");
                cardType.costDecay             = cardTypeResult.Read<int>   (i, "costDecay");
                cardType.costOrder             = cardTypeResult.Read<int>   (i, "costOrder");
                cardType.costGrowth            = cardTypeResult.Read<int>   (i, "costGrowth");
                cardType.costEnergy            = cardTypeResult.Read<int>   (i, "costEnergy");
                cardType.rulesList             = cardTypeResult.Read<string>(i, "rulesList");
                cardType.cardImage             = cardTypeResult.Read<int>   (i, "cardImage");
                cardType.animationPreviewImage = cardTypeResult.Read<int>   (i, "animationPreviewImage");
                cardType.animationPreviewInfo  = cardTypeResult.Read<string>(i, "animationPreviewInfo");
                cardType.animationBundle       = cardTypeResult.Read<int>   (i, "animationBundle");
                cardType.abilities             = cardTypeResult.Read<string>(i, "abilities");
                cardType.targetArea            = cardTypeResult.Read<string>(i, "targetArea");
                cardType.passiveRules          = cardTypeResult.Read<string>(i, "passiveRules");
                cardType.sound                 = cardTypeResult.Read<string>(i, "sound");
                cardType.soundProjectile       = cardTypeResult.Read<string>(i, "soundProjectile");
                cardType.available             = cardTypeResult.Read<int>   (i, "available");

                Variables.cardTypeMap.Add(cardType.id, cardType);

                if (cardType.costDecay != 0)
                {
                    Variables.cardTypeDecayMap.Add(cardType.id, cardType);
                }
                if (cardType.costEnergy != 0)
                {
                    Variables.cardTypeEnergyMap.Add(cardType.id, cardType);
                }
                if (cardType.costGrowth != 0)
                {
                    Variables.cardTypeGrowthMap.Add(cardType.id, cardType);
                }
                if (cardType.costOrder != 0)
                {
                    Variables.cardTypeOrderMap.Add(cardType.id, cardType);
                }
            }

            Console.WriteLine("Card Types     - Loaded {0} ({1} Decay, {2} Energy, {3} Growth, {4} Order)",
                Variables.cardTypeMap.Count, Variables.cardTypeDecayMap.Count, Variables.cardTypeEnergyMap.Count, Variables.cardTypeGrowthMap.Count, Variables.cardTypeOrderMap.Count);

            SQLResult deckTypeResult = DB.Database.Select(Variables.connection, false, false, "SELECT * FROM deck_types");

            for (int i = 0; i < deckTypeResult.Count; i++)
            {
                string deckName = deckTypeResult.Read<string>(i, "name");

                if (!Variables.deckTypeMap.ContainsKey(deckName))
                {
                    Variables.deckTypeMap.Add(deckName, new List<int>());
                }

                List<int> cardList = Variables.deckTypeMap[deckName];

                cardList.Add(deckTypeResult.Read<int>(i, "card"));
            }

            Console.WriteLine("Deck Types     - Loaded {0}", Variables.deckTypeMap.Count);

            SQLResult storeItemResult = DB.Database.Select(Variables.connection, false, false, "SELECT * FROM store_items");

            for (int i = 0; i < storeItemResult.Count; i++)
            {
                StoreItem storeItem = new StoreItem();
                storeItem.itemId      = storeItemResult.Read<int>   (i, "itemId");
                storeItem.itemType    = storeItemResult.Read<string>(i, "itemType");
                storeItem.itemName    = storeItemResult.Read<string>(i, "itemName");
                storeItem.description = storeItemResult.Read<string>(i, "description");
                storeItem.costGold    = storeItemResult.Read<int>   (i, "costGold");
                storeItem.costShards  = storeItemResult.Read<int>   (i, "costShards");

                if (storeItemResult.Read<int>(i, "isPublic") == 1)
                {
                    storeItem.isPublic = true;
                }
                else
                {
                    storeItem.isPublic = false;
                }

                Variables.storeItemMap.Add(storeItem.itemId, storeItem);
            }

            Console.WriteLine("Store Items    - Loaded {0}", Variables.storeItemMap.Count);

            SQLResult trialResult = DB.Database.Select(Variables.connection, false, false, "SELECT * FROM tower_info");

            for (int i = 0; i < trialResult.Count; i++)
            {
                Trial trial = new Trial();
                trial.id          = trialResult.Read<int>   (i, "id");
                trial.name        = trialResult.Read<string>(i, "name");
                trial.goldReward  = trialResult.Read<int>   (i, "goldReward");
                trial.description = trialResult.Read<string>(i, "description");
                trial.difficulty  = trialResult.Read<string>(i, "difficulty");
                trial.flavour     = trialResult.Read<string>(i, "flavour");

                Variables.trialMap.Add(trial.id, trial);
            }

            Console.WriteLine("Trial Missions - Loaded {0}", Variables.trialMap.Count);
        }

        public static void Configuration()
        {
            ConfigReader.Load();
        }

        public static void Rooms()
        {
            foreach (string roomName in ConfigReader.roomList.Split('|'))
            {
                RoomAPI.Add(roomName);
            }
        }

        public static void Database()
        {
            DB.Database.Connect(Variables.connection);
            DB.Database.Execute(Variables.connection, false, false, "UPDATE account SET signedIn = 0 WHERE signedIn = 1");
        }

        public static void Network()
        {
            Console.WriteLine("\nInitialising Network...");

            Listener routeListener  = ListenerHandler.Create("Route");
            Listener lobbyListener  = ListenerHandler.Create("Lobby");
            Listener battleListener = ListenerHandler.Create("Battle");

            if (routeListener.Start("0.0.0.0", ConfigReader.routePort))
            {
                routeListener.AcceptConnectionThread();
                Console.WriteLine("Route Server  - Listening on port {0}", ConfigReader.routePort);
            }
            if (lobbyListener.Start("0.0.0.0", ConfigReader.lobbyPort))
            {
                lobbyListener.AcceptConnectionThread();
                Console.WriteLine("Lobby Server  - Listening on port {0}", ConfigReader.lobbyPort);
            }
            if (battleListener.Start("0.0.0.0", ConfigReader.battlePort))
            {
                battleListener.AcceptConnectionThread();
                Console.WriteLine("Battle Server - Listening on port {0}", ConfigReader.battlePort);
            }
        }
    }
}
