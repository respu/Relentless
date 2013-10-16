using Newtonsoft.Json;
using Relentless.API;
using Relentless.Global;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class TradeHandler
    {
        public static void TradeAccept(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("TradeAccept");

            TradeAccept tradeAccept = JsonConvert.DeserializeObject<TradeAccept>(jsonPacketData);
            Client opponentSession = PlayerAPI.GetSession(tradeAccept.inviter, true);

            if (opponentSession != null)
            {
                if (opponentSession.account.tradeRequestList.Contains(client.account.username) && !opponentSession.account.tradeStatus.trading)
                {
                    //Note: Trade ID generation is temporary
                    Random random = new Random();
                    int tradeId = random.Next(1000000, 9999999);

                    client.account.tradeStatus.trading            = true;
                    client.account.tradeStatus.partner            = opponentSession.account.username;
                    client.account.tradeStatus.tradeId            = tradeId;
                    client.account.tradeStatus.initiator          = false;

                    opponentSession.account.tradeStatus.trading   = true;
                    opponentSession.account.tradeStatus.partner   = client.account.username;
                    opponentSession.account.tradeStatus.tradeId   = tradeId;
                    opponentSession.account.tradeStatus.initiator = true;

                    TradeResponse tradeResponse = new TradeResponse();
                    tradeResponse.status = "ACCEPT";
                    tradeResponse.from   = PlayerAPI.UserInfo(opponentSession);
                    tradeResponse.to     = PlayerAPI.UserInfo(client);

                    client.Send(tradeResponse);
                    opponentSession.Send(tradeResponse);

                    LibraryView libraryView = new LibraryView();
                    libraryView.profileId = client.account.id;

                    foreach (KeyValuePair<int, Card> card in client.account.cardMap)
                    {
                        libraryView.cards.Add(card.Value);
                    }

                    client.Send(libraryView);
                    opponentSession.Send(libraryView);

                    LibraryView libraryViewOpponent = new LibraryView();
                    libraryViewOpponent.profileId = opponentSession.account.id;

                    foreach (KeyValuePair<int, Card> card in opponentSession.account.cardMap)
                    {
                        libraryViewOpponent.cards.Add(card.Value);
                    }

                    client.Send(libraryViewOpponent);
                    opponentSession.Send(libraryViewOpponent);

                    string roomName = "trade-" + tradeId;

                    if (!RoomAPI.Exists(roomName))
                    {
                        RoomAPI.Add(roomName);
                    }

                    RoomAPI.JoinRoom(client, roomName);
                    RoomAPI.JoinRoom(opponentSession, roomName);

                    opponentSession.account.tradeRequestList.Remove(client.account.username);
                }
            }
        }

        public static void TradeAcceptBargain(Client client)
        {
            client.packetMap.Remove("TradeAcceptBargain");

            if (client.account.tradeStatus.trading)
            {
                Client opponentSession = PlayerAPI.GetSession(client.account.tradeStatus.partner, false);

                if (opponentSession != null && !client.account.tradeStatus.accepted)
                {
                    client.account.tradeStatus.accepted = !client.account.tradeStatus.accepted;

                    TradeViewUpdate(client, opponentSession);

                    if (opponentSession.account.tradeStatus.accepted)
                    {
                        if (client.account.tradeStatus.gold > 0)
                        {
                            PlayerAPI.RemoveGold(client, client.account.tradeStatus.gold);
                            PlayerAPI.IncreaseGold(opponentSession, client.account.tradeStatus.gold);
                        }
                        if (opponentSession.account.tradeStatus.gold > 0)
                        {
                            PlayerAPI.RemoveGold(opponentSession, opponentSession.account.tradeStatus.gold);
                            PlayerAPI.IncreaseGold(client, opponentSession.account.tradeStatus.gold);
                        }
                        if (client.account.tradeStatus.cardIds.Count > 0)
                        {
                            foreach (int cardId in client.account.tradeStatus.cardIds)
                            {
                                CardAPI.RemoveCardFromDecks(client, cardId);
                                CardAPI.TransferCard(client, opponentSession, cardId);

                                PlayerAPI.UpdateScrollTypeCount(client);
                                PlayerAPI.UpdateScrollTypeCount(opponentSession);
                            }
                        }
                        if (opponentSession.account.tradeStatus.cardIds.Count > 0)
                        {
                            foreach (int cardId in opponentSession.account.tradeStatus.cardIds)
                            {
                                CardAPI.RemoveCardFromDecks(opponentSession, cardId);
                                CardAPI.TransferCard(opponentSession, client, cardId);

                                PlayerAPI.UpdateScrollTypeCount(client);
                                PlayerAPI.UpdateScrollTypeCount(opponentSession);
                            }
                        }

                        RoomAPI.Message("trade-" + client.account.tradeStatus.tradeId, "Scrolls", "Trade complete.");
                    }
                }
            }
        }

        public static void TradeAddCards(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("TradeAddCards");

            TradeAddCards tradeAddCards = JsonConvert.DeserializeObject<TradeAddCards>(jsonPacketData);

            if (client.account.tradeStatus.trading)
            {
                Client opponentSession = PlayerAPI.GetSession(client.account.tradeStatus.partner, false);

                if (opponentSession != null)
                {
                    TradeDeckInvalidationWarning tradeDeckInvalidationWarning = new TradeDeckInvalidationWarning();

                    foreach (int cardId in tradeAddCards.cardIds)
                    {
                        if (CardAPI.Exists(client, cardId))
                        {
                            foreach (KeyValuePair<string, Deck> deck in client.account.deckMap)
                            {
                                foreach (Card deckCard in deck.Value.cards)
                                {
                                    if (deckCard.id == cardId)
                                    {
                                        tradeDeckInvalidationWarning.deckNames.Add(deck.Value.name);
                                        break;
                                    }
                                }
                            }

                            client.account.tradeStatus.cardIds.Add(cardId);
                        }
                    }

                    if (tradeDeckInvalidationWarning.deckNames.Count > 0)
                    {
                        client.Send(tradeDeckInvalidationWarning);
                    }

                    TradeViewUpdate(client, opponentSession);

                    OkMessage okMessage = new OkMessage();
                    okMessage.op = "TradeAddCards";

                    client.Send(okMessage);
                }
            }
        }

        public static void TradeCancel(Client client)
        {
            client.packetMap.Remove("TradeCancel");

            if (client.account.tradeStatus.trading)
            {
                Client opponentSession = PlayerAPI.GetSession(client.account.tradeStatus.partner, false);

                if (opponentSession != null)
                {
                    client.account.tradeStatus.trading          = false;
                    opponentSession.account.tradeStatus.trading = false;

                    TradeResponse tradeResponse = new TradeResponse();
                    tradeResponse.status = "CANCEL_BARGAIN";

                    if (client.account.tradeStatus.initiator)
                    {
                        tradeResponse.from = PlayerAPI.UserInfo(client);
                        tradeResponse.to   = PlayerAPI.UserInfo(opponentSession);
                    }
                    else
                    {
                        tradeResponse.from = PlayerAPI.UserInfo(opponentSession);
                        tradeResponse.to   = PlayerAPI.UserInfo(client);
                    }

                    client.Send(tradeResponse);
                    opponentSession.Send(tradeResponse);

                    RoomAPI.Message("trade-" + client.account.tradeStatus.tradeId, "Scrolls", "Trade ended.");
                }
            }
        }

        public static void TradeDecline(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("TradeDecline");

            TradeDecline tradeDecline = JsonConvert.DeserializeObject<TradeDecline>(jsonPacketData);
            Client opponentSession = PlayerAPI.GetSession(tradeDecline.inviter, true);

            if (opponentSession != null)
            {
                if (opponentSession.account.tradeRequestList.Contains(client.account.username))
                {
                    TradeResponse tradeResponse = new TradeResponse();
                    tradeResponse.status = "DECLINE";
                    tradeResponse.from   = PlayerAPI.UserInfo(opponentSession); 
                    tradeResponse.to     = PlayerAPI.UserInfo(client);

                    client.Send(tradeResponse);
                    opponentSession.Send(tradeResponse);

                    opponentSession.account.tradeRequestList.Remove(client.account.username);
                }
            }
        }

        public static void TradeInvite(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("TradeInvite");

            TradeInvite tradeInvite = JsonConvert.DeserializeObject<TradeInvite>(jsonPacketData);
            Client opponentSession = PlayerAPI.GetSession(tradeInvite.profile, true);

            if (opponentSession != null)
            {
                if (!client.account.tradeRequestList.Contains(opponentSession.account.username) && !opponentSession.account.tradeStatus.trading)
                {
                    client.account.tradeRequestList.Add(opponentSession.account.username);

                    OkMessage okMessage = new OkMessage();
                    okMessage.op = "TradeInvite";

                    client.Send(okMessage);

                    TradeInviteForward tradeInviteForward = new TradeInviteForward();
                    tradeInviteForward.inviter = PlayerAPI.UserInfo(client);

                    opponentSession.Send(tradeInviteForward);
                }
            }
        }

        public static void TradeRemoveCard(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("TradeRemoveCard");

            TradeRemoveCard tradeRemoveCard = JsonConvert.DeserializeObject<TradeRemoveCard>(jsonPacketData);

            if (client.account.tradeStatus.trading)
            {
                Client opponentSession = PlayerAPI.GetSession(client.account.tradeStatus.partner, false);

                if (opponentSession != null && client.account.tradeStatus.cardIds.Contains(tradeRemoveCard.cardId))
                {
                    client.account.tradeStatus.cardIds.Remove(tradeRemoveCard.cardId);

                    TradeViewUpdate(client, opponentSession);

                    OkMessage okMessage = new OkMessage();
                    okMessage.op = "TradeRemoveCard";

                    client.Send(okMessage);
                }
            }
        }

        public static void TradeSetGold(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("TradeSetGold");

            TradeSetGold tradeSetGold = JsonConvert.DeserializeObject<TradeSetGold>(jsonPacketData);

            if (client.account.tradeStatus.trading)
            {
                Client opponentSession = PlayerAPI.GetSession(client.account.tradeStatus.partner, false);

                if (opponentSession != null && client.account.gold >= tradeSetGold.gold)
                {
                    client.account.tradeStatus.gold = tradeSetGold.gold;

                    TradeViewUpdate(client, opponentSession);

                    OkMessage okMessage = new OkMessage();
                    okMessage.op = "TradeSetGold";

                    client.Send(okMessage);
                }
            }
        }

        public static void TradeUnacceptBargain(Client client)
        {
            client.packetMap.Remove("TradeUnacceptBargain");

            if (client.account.tradeStatus.trading)
            {
                Client opponentSession = PlayerAPI.GetSession(client.account.tradeStatus.partner, false);

                if (opponentSession != null && client.account.tradeStatus.accepted)
                {
                    client.account.tradeStatus.accepted = !client.account.tradeStatus.accepted;

                    TradeViewUpdate(client, opponentSession);
                }
            }
        }

        private static void TradeViewUpdate(Client client, Client opponentSession)
        {
            TradeView tradeView = new TradeView();
            tradeView.modified = true;

            if (client.account.tradeStatus.initiator)
            {
                tradeView.from.profile  = PlayerAPI.UserInfo(client);
                tradeView.from.cardIds  = client.account.tradeStatus.cardIds;
                tradeView.from.gold     = client.account.tradeStatus.gold;
                tradeView.from.accepted = client.account.tradeStatus.accepted;
                tradeView.to.profile    = PlayerAPI.UserInfo(opponentSession);
                tradeView.to.cardIds    = opponentSession.account.tradeStatus.cardIds;
                tradeView.to.gold       = opponentSession.account.tradeStatus.gold;
                tradeView.to.accepted   = opponentSession.account.tradeStatus.accepted;
            }
            else
            {
                tradeView.from.profile  = PlayerAPI.UserInfo(opponentSession);
                tradeView.from.cardIds  = opponentSession.account.tradeStatus.cardIds;
                tradeView.from.gold     = opponentSession.account.tradeStatus.gold;
                tradeView.from.accepted = opponentSession.account.tradeStatus.accepted;
                tradeView.to.profile    = PlayerAPI.UserInfo(client);
                tradeView.to.cardIds    = client.account.tradeStatus.cardIds;
                tradeView.to.gold       = client.account.tradeStatus.gold;
                tradeView.to.accepted   = client.account.tradeStatus.accepted;
            }

            client.Send(tradeView);
            opponentSession.Send(tradeView);
        }
    }
}
