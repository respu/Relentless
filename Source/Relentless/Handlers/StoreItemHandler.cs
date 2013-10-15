using Relentless.API;
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
                        Card card = CardAPI.AddCard(client, Variables.cardTypeDecayMap[Variables.cardTypeDecayMap.Keys.ToList()[random.Next(Variables.cardTypeDecayMap.Count)]]);
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_ENERGY":
                    {
                        Card card = CardAPI.AddCard(client, Variables.cardTypeEnergyMap[Variables.cardTypeEnergyMap.Keys.ToList()[random.Next(Variables.cardTypeEnergyMap.Count)]]);
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_FACE_DOWN":
                    {
                        Card card = CardAPI.AddCard(client, Variables.cardTypeMap[Variables.cardTypeMap.Keys.ToList()[random.Next(Variables.cardTypeMap.Count)]]);
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_GROWTH":
                    {
                        Card card = CardAPI.AddCard(client, Variables.cardTypeGrowthMap[Variables.cardTypeGrowthMap.Keys.ToList()[random.Next(Variables.cardTypeGrowthMap.Count)]]);
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_ORDER":
                    {
                        Card card = CardAPI.AddCard(client, Variables.cardTypeOrderMap[Variables.cardTypeOrderMap.Keys.ToList()[random.Next(Variables.cardTypeOrderMap.Count)]]);
                        buyStoreItemResponse.cards.Add(card);

                        break;
                    }
                case "CARD_PACK":
                    {
                        for (int i = 0; i < 10; i++)
                        {
                            Card card = CardAPI.AddCard(client, Variables.cardTypeMap[Variables.cardTypeMap.Keys.ToList()[random.Next(Variables.cardTypeMap.Count)]]);
                            buyStoreItemResponse.cards.Add(card);
                        }

                        break;
                    }
            }

            client.Send(buyStoreItemResponse);
        }
    }
}
