using Relentless.Database;
using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Relentless.Handlers
{
    public class StoreItemHandler
    {
        public static void PurchaseItem(Client client, string itemType)
        {
            BuyStoreItemResponse buyStoreItemResponse = new BuyStoreItemResponse();

            Random random = new Random();

            switch (itemType)
            {
                case "CARD_DECAY":
                    {
                        CardType cardType = Variables.cardTypeDecayMap[Variables.cardTypeDecayMap.Keys.ToList()[random.Next(Variables.cardTypeDecayMap.Count)]];

                        DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

                        Card card = new Card();
                        card.id       = DB.Database.lastId;
                        card.typeId   = cardType.id;
                        card.tradable = true;
                        card.isToken  = false;
                        card.level    = 0;

                        client.account.cardMap.Add(card.id, card);

                        buyStoreItemResponse.cards = new List<Card>();
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_ENERGY":
                    {
                        CardType cardType = Variables.cardTypeEnergyMap[Variables.cardTypeEnergyMap.Keys.ToList()[random.Next(Variables.cardTypeEnergyMap.Count)]];

                        DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

                        Card card = new Card();
                        card.id       = DB.Database.lastId;
                        card.typeId   = cardType.id;
                        card.tradable = true;
                        card.isToken  = false;
                        card.level    = 0;

                        client.account.cardMap.Add(card.id, card);

                        buyStoreItemResponse.cards = new List<Card>();
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_FACE_DOWN":
                    {
                        CardType cardType = Variables.cardTypeMap[Variables.cardTypeMap.Keys.ToList()[random.Next(Variables.cardTypeMap.Count)]];

                        DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

                        Card card = new Card();
                        card.id       = DB.Database.lastId;
                        card.typeId   = cardType.id;
                        card.tradable = true;
                        card.isToken  = false;
                        card.level    = 0;

                        client.account.cardMap.Add(card.id, card);

                        buyStoreItemResponse.cards = new List<Card>();
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_GROWTH":
                    {
                        CardType cardType = Variables.cardTypeGrowthMap[Variables.cardTypeGrowthMap.Keys.ToList()[random.Next(Variables.cardTypeGrowthMap.Count)]];

                        DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

                        Card card = new Card();
                        card.id       = DB.Database.lastId;
                        card.typeId   = cardType.id;
                        card.tradable = true;
                        card.isToken  = false;
                        card.level    = 0;

                        client.account.cardMap.Add(card.id, card);

                        buyStoreItemResponse.cards = new List<Card>();
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_ORDER":
                    {
                        CardType cardType = Variables.cardTypeOrderMap[Variables.cardTypeOrderMap.Keys.ToList()[random.Next(Variables.cardTypeOrderMap.Count)]];

                        DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

                        Card card = new Card();
                        card.id       = DB.Database.lastId;
                        card.typeId   = cardType.id;
                        card.tradable = true;
                        card.isToken  = false;
                        card.level    = 0;

                        client.account.cardMap.Add(card.id, card);

                        buyStoreItemResponse.cards = new List<Card>();
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_PACK":
                    {
                        buyStoreItemResponse.cards = new List<Card>();

                        for (int i = 0; i < 10; i++)
                        {
                            CardType cardType = Variables.cardTypeMap[Variables.cardTypeMap.Keys.ToList()[random.Next(Variables.cardTypeMap.Count)]];

                            DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

                            Card card = new Card();
                            card.id       = DB.Database.lastId;
                            card.typeId   = cardType.id;
                            card.tradable = true;
                            card.isToken  = false;
                            card.level    = 0;

                            client.account.cardMap.Add(card.id, card);

                            buyStoreItemResponse.cards.Add(card);
                        }

                        break;
                    }
            }

            client.Send(buyStoreItemResponse);
        }
    }
}
