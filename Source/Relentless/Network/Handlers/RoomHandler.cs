using Newtonsoft.Json;
using Relentless.API;
using Relentless.Configuration;
using Relentless.Global;
using Relentless.Handlers;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class RoomHandler
    {
        public static void RoomChatMessage(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("RoomChatMessage");

            RoomChatMessage roomChatMessage = JsonConvert.DeserializeObject<RoomChatMessage>(jsonPacketData);

            if (roomChatMessage.text.StartsWith("/"))
            {
                RoomChatHandler.HandleCommand(client, roomChatMessage.roomName, roomChatMessage.text.Remove(0, 1));
            }
            else
            {
                RoomAPI.Message(roomChatMessage.roomName, client.account.username, roomChatMessage.text);
            }
        }

        public static void RoomEnter(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("RoomEnter");

            RoomEnter roomEnterClient = JsonConvert.DeserializeObject<RoomEnter>(jsonPacketData);

            if (!RoomAPI.Exists(roomEnterClient.roomName))
            {
                RoomAPI.Add(roomEnterClient.roomName);
            }

            if (!RoomAPI.PlayerExists(roomEnterClient.roomName, client.account.username))
            {
                if (RoomAPI.GetPlayerList(roomEnterClient.roomName).Count != ConfigReader.maxRooms)
                {
                    RoomAPI.JoinRoom(client, roomEnterClient.roomName);
                }
                else
                {
                    //TODO: Room is full warning, currently no data has been obtained on how exactly this works
                }
            }
        }

        public static void RoomEnterFree(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("RoomEnterFree");

            RoomEnterFree roomEnterFree = JsonConvert.DeserializeObject<RoomEnterFree>(jsonPacketData);

            RoomAPI.JoinRoom(client, roomEnterFree.roomName);
        }

        public static void RoomEnterMulti(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("RoomEnterMulti");

            RoomEnterMulti roomEnterMulti = JsonConvert.DeserializeObject<RoomEnterMulti>(jsonPacketData);

            foreach (string roomName in roomEnterMulti.roomNames)
            {
                if (!RoomAPI.Exists(roomName))
                {
                    RoomAPI.Add(roomName);
                }

                RoomAPI.JoinRoom(client, roomName);
            }
        }

        public static void RoomExit(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("RoomExit");

            RoomExit roomExit = JsonConvert.DeserializeObject<RoomExit>(jsonPacketData);

            client.account.chatroomList.Remove(roomExit.roomName);
            RoomAPI.RemovePlayer(roomExit.roomName, client.account.username);
        }

        public static void RoomsList(Client client)
        {
            client.packetMap.Remove("RoomsList");

            RoomsList roomsList = new RoomsList();

            foreach (KeyValuePair<string, List<string>> roomServer in Variables.chatRoomMap)
            {
                RoomsList.Room roomClient = new RoomsList.Room();
                roomClient.room.name          = roomServer.Key;
                roomClient.room.autoIncrement = false;
                roomClient.numberOfUsers      = RoomAPI.PlayerCount(roomServer.Key);

                roomsList.rooms.Add(roomClient);
            }

            client.Send(roomsList);
        }

        public static void Whisper(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("Whisper");

            Whisper whisper = JsonConvert.DeserializeObject<Whisper>(jsonPacketData);

            if (PlayerAPI.IsOnline(whisper.toProfileName))
            {
                RoomAPI.Whisper(whisper.toProfileName, client.account.username, whisper.text);
            }
        }
    }
}
