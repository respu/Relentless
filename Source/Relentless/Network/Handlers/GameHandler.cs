using Newtonsoft.Json;
using Relentless.API;
using Relentless.Configuration;
using Relentless.Global;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class GameHandler
    {
        public static void GameChallengeAccept(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("GameChallengeAccept");

            GameChallengeAccept gameChallengeAccept = JsonConvert.DeserializeObject<GameChallengeAccept>(jsonPacketData);
            Client opponentSession = PlayerAPI.GetSession(gameChallengeAccept.profile, true);

            if (opponentSession.account.challengeMap.ContainsKey(client.account.username))
            {
                if (client.account.deckMap.ContainsKey(gameChallengeAccept.deck))
                {
                    Battle battle = new Battle()
                    {
                        gameType = "MP_QUICKMATCH",
                        opponent = opponentSession.account.username,
                        deck     = client.account.deckMap[gameChallengeAccept.deck]
                    };

                    Battle opponentBattle = new Battle()
                    {
                        gameType = "MP_QUICKMATCH",
                        opponent = client.account.username,
                        deck     = opponentSession.account.deckMap[opponentSession.account.challengeMap[client.account.username]]
                    };

                    if (new Random().Next(2) == 0)
                    {
                        battle.color         = "white";
                        opponentBattle.color = "black";
                    }
                    else
                    {
                        battle.color         = "black";
                        opponentBattle.color = "white";
                    }

                    if (new Random().Next(2) == 0)
                    {
                        battle.turnColor         = "white";
                        opponentBattle.turnColor = "white";
                    }
                    else
                    {
                        battle.turnColor         = "black";
                        opponentBattle.turnColor = "black";
                    }

                    Variables.battleMap.Add(client.account.username, battle);
                    Variables.battleMap.Add(opponentSession.account.username, opponentBattle);

                    BattleAPI.Redirect(client);
                    BattleAPI.Redirect(opponentSession);

                    opponentSession.account.challengeMap.Remove(client.account.username);
                }
                else
                {
                    Console.WriteLine("{0} is trying to repsond to {1} with the deck {2} which they don't own!", client.account.username, opponentSession.account.username, gameChallengeAccept.deck);
                    PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
                }  
            }
            else
            {
                Console.WriteLine("{0} tried to respond to a game challenge that was never sent!");
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }

        public static void GameChallengeDecline(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("GameChallengeDecline");

            GameChallengeDecline gameChallengeDecline = JsonConvert.DeserializeObject<GameChallengeDecline>(jsonPacketData);
            Client opponentSession = PlayerAPI.GetSession(gameChallengeDecline.profile, true);

            if (PlayerAPI.IsOnline(opponentSession.account.username))
            {
                OkMessage okMessage = new OkMessage();
                okMessage.op = "GameChallengeDecline";

                client.Send(okMessage);

                GameChallengeResponse gameChallengeResponse = new GameChallengeResponse();
                gameChallengeResponse.status = "DECLINE";

                gameChallengeResponse.from.id               = opponentSession.account.id;
                gameChallengeResponse.from.userUuid         = "";
                gameChallengeResponse.from.name             = opponentSession.account.username;
                gameChallengeResponse.from.acceptChallenges = opponentSession.account.acceptChallenges;
                gameChallengeResponse.from.acceptTrades     = opponentSession.account.acceptTrades;
                gameChallengeResponse.from.adminRole        = opponentSession.account.adminRole;
                gameChallengeResponse.from.userType         = "Beta";

                gameChallengeResponse.to.id               = client.account.id;
                gameChallengeResponse.to.userUuid         = "";
                gameChallengeResponse.to.name             = client.account.username;
                gameChallengeResponse.to.acceptChallenges = client.account.acceptChallenges;
                gameChallengeResponse.to.acceptTrades     = client.account.acceptTrades;
                gameChallengeResponse.to.adminRole        = client.account.adminRole;
                gameChallengeResponse.to.userType         = "Beta";

                client.Send(gameChallengeResponse);
                opponentSession.Send(gameChallengeResponse);
            }
        }

        public static void GameChallengeRequest(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("GameChallengeRequest");

            GameChallengeRequest gameChallengeRequest = JsonConvert.DeserializeObject<GameChallengeRequest>(jsonPacketData);
            Client opponentSession = PlayerAPI.GetSession(gameChallengeRequest.profile, true);

            if (PlayerAPI.IsOnline(opponentSession.account.username))
            {
                if (client.account.deckMap.ContainsKey(gameChallengeRequest.deck))
                {
                    client.account.challengeMap.Add(opponentSession.account.username, gameChallengeRequest.deck);

                    OkMessage okMessage = new OkMessage();
                    okMessage.op = "GameChallengeRequest";

                    client.Send(okMessage);

                    GameChallenge gameChallenge = new GameChallenge();
                    gameChallenge.from.id               = client.account.id;
                    gameChallenge.from.userUuid         = "";
                    gameChallenge.from.name             = client.account.username;
                    gameChallenge.from.acceptChallenges = client.account.acceptChallenges;
                    gameChallenge.from.acceptTrades     = client.account.acceptTrades;
                    gameChallenge.from.adminRole        = client.account.adminRole;
                    gameChallenge.from.userType         = "Beta";

                    opponentSession.Send(gameChallenge);
                }
                else
                {
                    Console.WriteLine("{0} is trying to challenge {1} with the deck {2} which they don't own!", client.account.username, opponentSession.account.username, gameChallengeRequest.deck);
                    PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
                }
            }
            else
            {
                Console.WriteLine("{0} is trying to challenge someone who is offline or doesn't exist!", opponentSession.account.username);
                PlayerAPI.KickPlayer(client, "AntiCheat: You have been disconnected from the server!");
            }
        }

        public static void GetTowerInfo(Client client)
        {
            client.packetMap.Remove("GetTowerInfo");

            GetTowerInfo getTowerInfo = new GetTowerInfo();

            foreach (KeyValuePair<int, Trial> trial in Variables.trialMap)
            {
                GetTowerInfo.Level level = new GetTowerInfo.Level();
                level.id          = trial.Value.id;
                level.name        = trial.Value.name;
                level.goldReward  = trial.Value.goldReward;
                level.description = trial.Value.description;
                level.difficulty  = trial.Value.difficulty;
                level.flavour     = trial.Value.flavour;
                level.isComplete  = false;

                getTowerInfo.levels.Add(level);
            }

            client.Send(getTowerInfo);
        }

        public static void PlayMultiPlayerRankedMatch(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("PlayMultiPlayerRankedMatch");

            foreach (string roomName in client.account.chatroomList)
            {
                RoomAPI.Message(roomName, "Scrolls", "Multiplayer ranked match is currently disabled", client);
            }
        }

        public static void PlayMultiPlayerQuickMatch(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("PlayMultiPlayerQuickMatch");

            foreach (string roomName in client.account.chatroomList)
            {
                RoomAPI.Message(roomName, "Scrolls", "Multiplayer quick match is currently disabled", client);
            }
        }

        public static void PlaySinglePlayerTutorial(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("PlaySinglePlayerTutorial");

            foreach (string roomName in client.account.chatroomList)
            {
                RoomAPI.Message(roomName, "Scrolls", "Single player tutorial is currently disabled", client);
            }
        }

        public static void PlaySinglePlayerQuickMatch(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("PlaySinglePlayerQuickMatch");

            foreach (string roomName in client.account.chatroomList)
            {
                RoomAPI.Message(roomName, "Scrolls", "Single player quick match is currently disabled", client);
            }
        }
    }
}
