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
            
            bool purchaseComplete  = false;
            string purchaseMessage = "";
            StoreItem storeItem    = null;

            BuyStoreItem buyStoreItem = JsonConvert.DeserializeObject<BuyStoreItem>(jsonPacketData);

            if (Variables.storeItemMap.ContainsKey(buyStoreItem.itemId))
            {
                storeItem = Variables.storeItemMap[buyStoreItem.itemId];

                if (buyStoreItem.payWithShards == true)
                {
                    if (client.account.shards >= storeItem.costShards)
                    {
                        purchaseComplete = true;

                        PlayerAPI.RemoveShards(client, storeItem.costShards);
                    }
                    else
                    {
                        purchaseComplete = false;
                        purchaseMessage  = "Not enough shards to purchase this item.";
                    }
                }
                else
                {
                    if (client.account.gold >= storeItem.costGold)
                    {
                        purchaseComplete = true;

                        PlayerAPI.RemoveGold(client, storeItem.costGold);
                    }
                    else
                    {
                        purchaseComplete = false;
                        purchaseMessage  = "Not enough gold to purchase this item.";
                    }
                }
            }
            else
            {
                Console.WriteLine("{0} tried to purchase an item with an item Id that doesn't exist!", client.account.username);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }

            if (purchaseComplete == true)
            {
                StoreItemHandler.PurchaseItem(client, storeItem.itemType);
                ProfileHandler.ProfileDataInfo(client);
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
                if (storeItem.Value.isPublic == true)
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

            bool saleComplete = true;
            int totalGold     = 0;

            SellCards sellCards = JsonConvert.DeserializeObject<SellCards>(jsonPacketData);

            client.connection.Open();

            foreach (int cardId in sellCards.cardIds)
            {
                if (client.account.cardMap.ContainsKey(cardId))
                {
                    if (CardAPI.GetCard(client, cardId).tradable == true)
                    {
                        switch (CardAPI.GetCardType(client.account.cardMap[cardId].typeId).rarity)
                        {
                            case 0:
                                {
                                    totalGold += ConfigReader.sellCommon;
                                    break;
                                }
                            case 1:
                                {
                                    totalGold += ConfigReader.sellUncommon;
                                    break;
                                }
                            case 2:
                                {
                                    totalGold += ConfigReader.sellRare;
                                    break;
                                }
                        }

                        client.account.cardMap.Remove(cardId);
                        DB.Database.Execute(client.connection, false, false, "DELETE FROM account_cards WHERE id = ?", cardId);
                    }
                    else
                    {
                        Console.WriteLine("{0} tried to sell the card {1} which isn't tradable!", client.account.username, cardId);
                        PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");

                        saleComplete = false;
                    }
                }
                else
                {
                    Console.WriteLine("{0} tried to sell the card {1} which doesn't belong to them!", client.account.username, cardId);
                    PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");

                    saleComplete = false;

                    break;
                }
            }

            client.connection.Close();

            if (saleComplete)
            {
                DB.Database.Execute(client.connection, true, true, "UPDATE server_stats SET totalSoldCards = totalSoldCards + 1"); 

                PlayerAPI.IncreaseGold(client, totalGold);

                OkMessage okMessage = new OkMessage();
                okMessage.op = "SellCards";

                client.Send(okMessage);
            }
        }
    }
}
