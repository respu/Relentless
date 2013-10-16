using Newtonsoft.Json;
using Relentless.API;
using Relentless.Configuration;
using Relentless.Database;
using Relentless.Global;
using Relentless.Handlers;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class StoreHandler
    {
        public static void BuyStoreItem(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("BuyStoreItem");

            BuyStoreItem buyStoreItem = JsonConvert.DeserializeObject<BuyStoreItem>(jsonPacketData);

            string purchaseMessage = "";
            StoreItem storeItem    = null;
            
            if (Variables.storeItemMap.ContainsKey(buyStoreItem.itemId))
            {
                storeItem = Variables.storeItemMap[buyStoreItem.itemId];

                if (buyStoreItem.payWithShards)
                {
                    if (client.account.shards >= storeItem.costShards)
                    {
                        PlayerAPI.RemoveShards(client, storeItem.costShards);
                    }
                    else { purchaseMessage  = "Not enough shards to purchase this item."; }
                }
                else
                {
                    if (client.account.gold >= storeItem.costGold)
                    {
                        PlayerAPI.RemoveGold(client, storeItem.costGold);
                    }
                    else { purchaseMessage = "Not enough gold to purchase this item."; }
                }
            }

            if (String.IsNullOrEmpty(purchaseMessage))
            {
                StoreItemHandler.PurchaseItem(client, storeItem.itemType);
                ProfileHandler.ProfileDataInfo(client);

                PlayerAPI.UpdateScrollTypeCount(client);
            }
            else
            {
                FailMessage failMessage = new FailMessage();
                failMessage.op   = "BuyStoreItem";
                failMessage.info = purchaseMessage;

                client.Send(failMessage);
            }
        }

        public static void GetStoreItems(Client client)
        {
            client.packetMap.Remove("GetStoreItems");

            GetStoreItems getStoreItems = new GetStoreItems();

            foreach (KeyValuePair<int, StoreItem> storeItem in Variables.storeItemMap)
            {
                if (storeItem.Value.isPublic)
                {
                    getStoreItems.items.Add(storeItem.Value);
                }
            }

            getStoreItems.cardSellbackGold.Add(ConfigReader.sellCommon);
            getStoreItems.cardSellbackGold.Add(ConfigReader.sellUncommon);
            getStoreItems.cardSellbackGold.Add(ConfigReader.sellRare);
            getStoreItems.cardSellbackGold.Add(1000);
            getStoreItems.cardSellbackGold.Add(1000);
            getStoreItems.cardSellbackGold.Add(1000);

            client.Send(getStoreItems);
        }

        public static void SellCards(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("SellCards");

            SellCards sellCards = JsonConvert.DeserializeObject<SellCards>(jsonPacketData);

            bool saleError = false;
            int totalGold  = 0;

            foreach (int cardId in sellCards.cardIds)
            {
                if (CardAPI.Exists(client, cardId))
                {
                    if (CardAPI.GetCard(client, cardId).tradable)
                    {
                        switch (CardAPI.GetCardType(client.account.cardMap[cardId].typeId).rarity)
                        {
                            case 0: { totalGold += ConfigReader.sellCommon; break; }
                            case 1: { totalGold += ConfigReader.sellUncommon; break; }
                            case 2: { totalGold += ConfigReader.sellRare; break; }
                        }

                        CardAPI.RemoveCard(client, cardId);
                    }
                    else { saleError = true; }
                }
                else { saleError = true; }
            }

            if (!saleError)
            {
                DB.Database.Execute(client.connection, true, true, "UPDATE server_stats SET totalSoldCards = totalSoldCards + ?", sellCards.cardIds.Count); 

                PlayerAPI.IncreaseGold(client, totalGold);
                PlayerAPI.UpdateScrollTypeCount(client);

                OkMessage okMessage = new OkMessage();
                okMessage.op = "SellCards";

                client.Send(okMessage);
            }
        }
    }
}
