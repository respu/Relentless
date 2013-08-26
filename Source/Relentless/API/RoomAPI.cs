using Relentless.Global;
using Relentless.Network;
using System.Collections.Generic;

namespace Relentless.API
{
    public class RoomAPI
    {
        public static void Add(string roomName)
        {
            Variables.chatRoomMap.Add(roomName, new List<string>());
        }

        public static void AddPlayer(string roomName, string playerName)
        {
            GetPlayerList(roomName).Add(playerName);
        }

        public static bool Exists(string roomName)
        {
            return Variables.chatRoomMap.ContainsKey(roomName);
        }

        public static List<string> GetPlayerList(string roomName)
        {
            return Variables.chatRoomMap[roomName];
        }

        public static void JoinRoom(Client client, string roomName)
        {
            client.account.chatroomList.Add(roomName);

            RoomAPI.AddPlayer(roomName, client.account.username);
            List<string> playerList = RoomAPI.GetPlayerList(roomName);

            RoomEnter roomEnterServer = new RoomEnter();
            roomEnterServer.roomName = roomName;

            client.Send(roomEnterServer);

            RoomInfo roomInfo = new RoomInfo();
            roomInfo.updated  = new List<RoomInfo.PlayerInfo>();
            roomInfo.roomName = roomName;
            roomInfo.reset    = false;

            foreach (string playerName in playerList)
            {
                Client roomClient = PlayerAPI.GetSession(playerName, false);

                RoomInfo.PlayerInfo playerInfo = new RoomInfo.PlayerInfo();
                playerInfo.id               = roomClient.account.id;
                playerInfo.name             = roomClient.account.username;
                playerInfo.acceptChallenges = roomClient.account.acceptChallenges;
                playerInfo.acceptTrades     = roomClient.account.acceptTrades;
                playerInfo.adminRole        = roomClient.account.adminRole;

                roomInfo.updated.Add(playerInfo);
            }

            client.Send(roomInfo);

            RoomAPI.Message(roomName, "Scrolls", "You have joined \"" + roomName + "\"", client);

            RoomInfo newPlayerAlert = new RoomInfo();
            newPlayerAlert.updated  = new List<RoomInfo.PlayerInfo>();
            newPlayerAlert.roomName = roomName;

            RoomInfo.PlayerInfo newPlayerInfo = new RoomInfo.PlayerInfo();
            newPlayerInfo.id               = client.account.id;
            newPlayerInfo.name             = client.account.username;
            newPlayerInfo.acceptChallenges = client.account.acceptChallenges;
            newPlayerInfo.acceptTrades     = client.account.acceptTrades;
            newPlayerInfo.adminRole        = client.account.adminRole;

            newPlayerAlert.updated.Add(newPlayerInfo);

            foreach (string playerName in playerList)
            {
                PlayerAPI.GetSession(playerName, false).Send(newPlayerAlert);
            }
        }

        public static void Message(string roomName, string from, string message)
        {
            RoomChatMessage roomChatMessage = new RoomChatMessage();
            roomChatMessage.roomName = roomName;
            roomChatMessage.from     = from;
            roomChatMessage.text     = message;

            List<string> playerList = RoomAPI.GetPlayerList(roomName);

            foreach (string playerName in playerList)
            {
                PlayerAPI.GetSession(playerName, false).Send(roomChatMessage);
            }
        }

        public static void Message(string roomName, string from, string message, Client client)
        {
            RoomChatMessage roomChatMessage = new RoomChatMessage();
            roomChatMessage.roomName = roomName;
            roomChatMessage.from     = from;
            roomChatMessage.text     = message;

            client.Send(roomChatMessage);
        }

        public static int PlayerCount(string roomName)
        {
            return GetPlayerList(roomName).Count;
        }

        public static bool PlayerExists(string roomName, string playerName)
        {
            return GetPlayerList(roomName).Contains(playerName);
        }

        public static void RemovePlayer(string roomName, string playerName)
        {
            if (PlayerExists(roomName, playerName))
            {
                GetPlayerList(roomName).Remove(playerName);
            }

            RemovePlayerAlert(roomName, playerName);
        }

        private static void RemovePlayerAlert(string roomName, string playerName)
        {
            List<string> playerList = GetPlayerList(roomName);

            RoomInfo roomInfo = new RoomInfo();
            roomInfo.removed  = new List<RoomInfo.PlayerInfo>();
            roomInfo.roomName = roomName;

            RoomInfo.PlayerInfo playerInfo = new RoomInfo.PlayerInfo();
            playerInfo.name = playerName;

            roomInfo.removed.Add(playerInfo);

            foreach (string roomPlayerName in playerList)
            {
                PlayerAPI.GetSession(roomPlayerName, false).Send(roomInfo);
            }
        }

        public static void Whisper(string to, string from, string msg)
        {
            Whisper whisper = new Whisper();

            whisper.toProfileName = to;
            whisper.from          = from;
            whisper.text          = msg;

            PlayerAPI.GetSession(from, false).Send(whisper);
            PlayerAPI.GetSession(to, false).Send(whisper);
        }
    }
}
