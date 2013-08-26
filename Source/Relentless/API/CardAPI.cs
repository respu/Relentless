using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;

namespace Relentless.API
{
    public class CardAPI
    {
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

        public static void ShuffleDeck(Deck deck)
        {
            deck.cards.Shuffle();
        }
    }
}
