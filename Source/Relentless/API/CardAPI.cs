using Relentless.Database;
using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Relentless.API
{
    public class CardAPI
    {
        public static Card AddCard(Client client, CardType cardType)
        {
            DB.Database.Execute(client.connection, true, true, "INSERT INTO account_cards VALUES (0, ?, ?, 1, 0, 0);", client.account.id, cardType.id);

            Card card = new Card();
            card.id       = DB.Database.lastId;
            card.typeId   = cardType.id;
            card.tradable = true;
            card.isToken  = false;
            card.level    = 0;

            client.account.cardMap.Add(card.id, card);

            return card;
        }

        public static Card DrawCard(Battle battle)
        {
            if (battle.deck.cards.Count == 0)
            {
                foreach (KeyValuePair<int, Card> card in battle.discardMap)
                {
                    battle.deck.cards.Add(card.Value);
                    battle.discardMap.Remove(card.Key);
                }

                ShuffleDeck(battle.deck);
            }

            Card drawnCard = battle.deck.cards[0];
            battle.deck.cards.Remove(drawnCard);

            return drawnCard;
        }

        public static bool Exists(Client client, int cardId)
        {
            return client.account.cardMap.ContainsKey(cardId);
        }

        public static Card GetCard(Client client, int cardId)
        {
            if (client.account.cardMap.ContainsKey(cardId))
            {
                return client.account.cardMap[cardId];
            }

            return null;
        }

        public static CardType GetCardType(int cardType)
        {
            if (Variables.cardTypeMap.ContainsKey(cardType))
            {
                return Variables.cardTypeMap[cardType];
            }

            return null;
        }

        public static void RemoveCardFromDecks(Client client, int cardId)
        {
            bool cardFound = false;

            foreach (KeyValuePair<string, Deck> deck in client.account.deckMap.ToArray())
            {
                foreach (Card deckCard in deck.Value.cards.ToArray())
                {
                    if (deckCard.id == cardId)
                    {
                        client.account.deckMap[deck.Value.name].cards.Remove(deckCard);
                        cardFound = true;

                        break;
                    }
                }
                if (cardFound)
                {
                    string newCardString = "";

                    if (client.account.deckMap[deck.Value.name].cards.Count > 0)
                    {
                        foreach (Card deckCard in deck.Value.cards)
                        {
                            newCardString += deckCard.id;
                        }

                        DB.Database.Execute(client.connection, true, true, "UPDATE account_decks SET cards = ? WHERE guid = ? AND name = ?", newCardString, client.account.id, client.account.username);
                    }
                    else
                    {
                        client.account.deckMap.Remove(deck.Value.name);
                        DB.Database.Execute(client.connection, true, true, "DELETE FROM account_decks WHERE guid = ? AND name = ?", client.account.id, deck.Value.name);
                    }
                }
            }
        }

        public static void ShuffleDeck(Deck deck)
        {
            deck.cards.Shuffle();
        }

        public static void TransferCard(Client owner, Client newOwner, int cardId)
        {
            newOwner.account.cardMap.Add(cardId, CardAPI.GetCard(owner, cardId));
            owner.account.cardMap.Remove(cardId);

            DB.Database.Execute(owner.connection, true, true, "UPDATE account_cards SET guid = ? WHERE id = ? AND guid = ?", newOwner.account.id, cardId, owner.account.id);
        }
    }
}
