using Itenso.TimePeriod;
using Newtonsoft.Json;
using Relentless.API;
using Relentless.Database;
using Relentless.Global;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class DeckHandler
    {
        public static void DeckCards(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("DeckCards");

            DeckCards deckCardsClient = JsonConvert.DeserializeObject<DeckCards>(jsonPacketData);
            DeckCards deckCardsServer = new DeckCards();

            if (client.account.deckMap.ContainsKey(deckCardsClient.deck))
            {
                Deck deck = client.account.deckMap[deckCardsClient.deck];

                deckCardsServer.deck     = deckCardsClient.deck;
                deckCardsServer.valid    = deck.valid;
                deckCardsServer.metadata = deck.metadata;

                foreach (string resource in deck.resources)
                {
                    deckCardsServer.resources.Add(resource);
                }

                foreach (Card card in deck.cards)
                {
                    deckCardsServer.cards.Add(card);
                }

                client.Send(deckCardsServer);
            }
            else
            {
                Console.WriteLine("{0} requested the deck {1} which they don't own!", client.account.username, deckCardsClient.deck);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }

        public static void DeckDelete(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("DeckDelete");

            DeckDelete deckDelete = JsonConvert.DeserializeObject<DeckDelete>(jsonPacketData);

            if (client.account.deckMap.ContainsKey(deckDelete.name))
            {
                int lastId;
                DB.Database.Execute(client.connection, out lastId, true, true, "DELETE FROM account_decks WHERE guid = ? AND name = ?", client.account.id, deckDelete.name);

                client.account.deckMap.Remove(deckDelete.name);
                
                OkMessage okMessage = new OkMessage();
                okMessage.op = "DeckDelete";

                client.Send(okMessage);
            }
            else
            {
                Console.WriteLine("{0} is trying to delete the deck {1} which they don't own!", client.account.username, deckDelete.name);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }

        public static void DeckList(Client client)
        {
            client.packetMap.Remove("DeckList");

            DeckList deckList = new DeckList();

            foreach (KeyValuePair<string, Deck> deckServer in client.account.deckMap)
            {
                DeckList.Deck deckClient = new DeckList.Deck();
                deckClient.name = deckServer.Value.name;

                string resources = "";
                foreach (string resource in deckServer.Value.resources)
                {
                    resources += resource + ",";
                }

                resources.Remove(resources.Length - 1);

                deckClient.resources = resources;
                deckClient.valid     = deckServer.Value.valid;
                deckClient.timestamp = deckServer.Value.timestamp;

                DateTime dateTimeTimestamp = new DateTime(deckServer.Value.timestamp);
                DateTime dateTimeNow       = DateTime.Now;

                TimeBlock timeBlock = new TimeBlock(dateTimeTimestamp, dateTimeNow);

                if (timeBlock.DurationDescription == String.Empty)
                {
                    deckClient.updated = "A few moments ago";
                }
                else
                {
                    deckClient.updated = timeBlock.DurationDescription;
                }

                deckList.decks.Add(deckClient);

            }

            client.Send(deckList);
        }

        public static void DeckSave(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("DeckSave");

            int lastId;
            bool deckValidated = true;
            string failMessage = "";

            DeckSave deckSave = JsonConvert.DeserializeObject<DeckSave>(jsonPacketData);

            foreach (int cardId in deckSave.cards)
            {
                if (!client.account.deckValidate.Contains(cardId))
                {
                    deckValidated = false;
                    failMessage   = client.account.username + " failed deck validation: Card ID " + cardId + " isn't validated!";
                }
            }

            if (deckValidated == true)
            {
                string cards     = "";
                string resources = "";
                
                Deck deck = new Deck();
                deck.name      = deckSave.name;
                deck.timestamp = DateTime.Now.Ticks;
                deck.metadata  = deckSave.metadata;

                foreach (int cardId in client.account.deckValidate)
                {
                    string resource = CardAPI.GetCardType(CardAPI.GetCard(client, cardId).typeId).GetResourceType();

                    if (!deck.resources.Contains(resource))
                    {
                        resources += resource + "|";
                        deck.resources.Add(resource);
                    }

                    cards += cardId + "|";
                    deck.cards.Add(CardAPI.GetCard(client, cardId));
                }

                if (client.account.deckValidate.Count >= 50)
                {
                    deck.valid = true;
                }
                else
                {
                    deck.valid = false;
                }

                if (client.account.deckMap.ContainsKey(deck.name))
                {
                    DB.Database.Execute(client.connection, out lastId, true, true, "UPDATE account_decks SET name = ?, resources = ?, timestamp = ?, metadata = ?, cards = ?, valid = ? WHERE guid = ? AND name = ?",
                        deck.name, resources.TrimEnd('|'), deck.timestamp, deck.metadata, cards.TrimEnd('|'), deck.valid, client.account.id, deck.name);

                    client.account.deckMap.Remove(deck.name);
                }
                else
                {
                    DB.Database.Execute(client.connection, out lastId, true, true, "INSERT INTO account_decks VALUES (0, ?, ?, ?, ?, ?, ?, ?);",
                        client.account.id, deck.name, resources.TrimEnd('|'), deck.timestamp, deck.metadata, cards.TrimEnd('|'), deck.valid);
                }

                client.account.deckMap.Add(deck.name, deck);
            }
            else
            {
                Console.WriteLine(failMessage);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }

        public static void DeckValidate(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("DeckValidate");

            client.account.deckValidate.Clear();

            Dictionary<int, int> cardCount = new Dictionary<int, int>();

            int cardTotal       = 0;
            bool cardsValidated = true;
            string failMessage  = "";

            DeckValidate deckValidateClient = JsonConvert.DeserializeObject<DeckValidate>(jsonPacketData);
            DeckValidate deckValidateServer = new DeckValidate();

            foreach (int cardId in deckValidateClient.cards)
            {
                if (client.account.cardMap.ContainsKey(cardId))
                {
                    Card card = CardAPI.GetCard(client, cardId);

                    if (!cardCount.ContainsKey(card.typeId))
                    {
                        cardCount.Add(card.typeId, 1);
                    }
                    else
                    {
                        cardCount[card.typeId]++;

                        if (cardCount[card.typeId] >= 4)
                        {
                            cardsValidated = false;
                            failMessage    = client.account.username + " failed card validation: Too many cards of type " + card.typeId + "!";

                            break;
                        }
                    }

                    client.account.deckValidate.Add(cardId);
                    cardTotal++;
                }
                else
                {
                    cardsValidated = false;
                    failMessage    = client.account.username + " failed card validation: Player doesn't own card ID " + cardId + "!";

                    break;
                }
            }

            if (cardsValidated == true)
            {
                deckValidateServer.errors = new List<DeckValidate.Error>();

                if (cardTotal < 50)
                {
                    //Note: Game doesn't respond with deck save dialog when sending an error. Doing something wrong?
                }

                client.Send(deckValidateServer);
            }
            else
            {
                Console.WriteLine(failMessage);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }

        public static void LibraryView(Client client)
        {
            client.packetMap.Remove("LibraryView");

            LibraryView libraryView = new LibraryView();
            libraryView.profileId   = client.account.id;

            foreach (KeyValuePair<int, Card> cardServer in client.account.cardMap)
            {
                libraryView.cards.Add(cardServer.Value);
            }

            client.Send(libraryView);
        }
    }
}
