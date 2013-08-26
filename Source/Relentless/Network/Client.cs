using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using Relentless.API;
using Relentless.Database;
using Relentless.Global;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace Relentless.Network
{
    public class Client
    {
        public Account account;
        public Socket clientSocket;
        public MySqlConnection connection;
        public string clientType;
        byte[] dataBuffer;
        public Dictionary<string, string> packetMap;
        JsonSerializerSettings settings;

        public Client()
        {
            account    = new Account();
            dataBuffer = new byte[16384];

            settings = new JsonSerializerSettings();
            settings.NullValueHandling    = NullValueHandling.Ignore;
            settings.DefaultValueHandling = DefaultValueHandling.Ignore;
        }

        public void Disconnect()
        {
            if (account.authenticated == true)
            {
                if (clientType == "Battle")
                {
                    BattleAPI.Message(BattleAPI.GetBattle(account.username), "Scrolls", account.username + " has disconnected!");
                }
                if (clientType == "Lobby")
                {
                    foreach (string roomName in account.chatroomList)
                    {
                        RoomAPI.RemovePlayer(roomName, account.username);
                    }
                }

                DB.Database.Execute(connection, true, true, "UPDATE account SET signedIn = 0 WHERE guid = ?", account.id);

                Variables.sessionMap.Remove(account.username);
                connection.Dispose();
            }
        }

        public void OnConnect()
        {
            if (clientType == "Lobby" || clientType == "Battle")
            {
                connection = new MySqlConnection(MySQLHandler.connectionString);
            }

            ServerInfo serverInfo = new ServerInfo();
            serverInfo.version  = Global.Variables.serverVersion;
            serverInfo.assetURL = Global.Variables.assetUrl;

            Send(serverInfo);

            clientSocket.BeginReceive(dataBuffer, 0, dataBuffer.Length, SocketFlags.None, Receive, null);
        }

        private void OnData(string jsonString)
        {
            //Note: Will be changed at some point with invoke and a lookup list/map (or similar)

            try
            {
                packetMap = PacketMap(jsonString);

                if (clientType == "Route")
                {
                    if (packetMap.ContainsKey("LobbyLookup")) { MiscHandler.LobbyLookup(this); }
                }
                else if (clientType == "Lobby")
                {
                    if (account.authenticated == false)
                    {
                        if (packetMap.ContainsKey("Ping"))      { MiscHandler.Ping       (this); }
                        if (packetMap.ContainsKey("Reconnect")) { SignInHandler.Reconnect(this, packetMap["Reconnect"]); }
                        if (packetMap.ContainsKey("SignIn"))    { SignInHandler.SignIn   (this, packetMap["SignIn"]); }
                    }
                    else
                    {
                        if (packetMap.ContainsKey("AvatarSave"))                 { ProfileHandler.AvatarSave             (this, packetMap["AvatarSave"]); }
                        if (packetMap.ContainsKey("AvatarTypes"))                { AssetHandler.AvatarTypes              (this); }
                        if (packetMap.ContainsKey("BuyStoreItem"))               { StoreHandler.BuyStoreItem             (this, packetMap["BuyStoreItem"]); }
                        if (packetMap.ContainsKey("CardTypes"))                  { AssetHandler.CardTypes                (this); }
                        if (packetMap.ContainsKey("DeckCards"))                  { DeckHandler.DeckCards                 (this, packetMap["DeckCards"]); }
                        if (packetMap.ContainsKey("DeckDelete"))                 { DeckHandler.DeckDelete                (this, packetMap["DeckDelete"]); }
                        if (packetMap.ContainsKey("DeckSave"))                   { DeckHandler.DeckSave                  (this, packetMap["DeckSave"]); }
                        if (packetMap.ContainsKey("DeckList"))                   { DeckHandler.DeckList                  (this); }
                        if (packetMap.ContainsKey("DeckValidate"))               { DeckHandler.DeckValidate              (this, packetMap["DeckValidate"]); }
                        if (packetMap.ContainsKey("GameChallengeAccept"))        { GameHandler.GameChallengeAccept       (this, packetMap["GameChallengeAccept"]); }
                        if (packetMap.ContainsKey("GameChallengeDecline"))       { GameHandler.GameChallengeDecline      (this, packetMap["GameChallengeDecline"]); }
                        if (packetMap.ContainsKey("GameChallengeRequest"))       { GameHandler.GameChallengeRequest      (this, packetMap["GameChallengeRequest"]); }
                        if (packetMap.ContainsKey("GetStoreItems"))              { StoreHandler.GetStoreItems            (this); }
                        if (packetMap.ContainsKey("GetTowerInfo"))               { GameHandler.GetTowerInfo              (this); }
                        if (packetMap.ContainsKey("GetTwitterFeed"))             { MiscHandler.GetTwitterFeed            (this); }
                        if (packetMap.ContainsKey("LibraryView"))                { DeckHandler.LibraryView               (this); }
                        if (packetMap.ContainsKey("OverallStats"))               { MiscHandler.OverallStats              (this); }
                        if (packetMap.ContainsKey("Ping"))                       { MiscHandler.Ping                      (this); }
                        if (packetMap.ContainsKey("PlayMultiPlayerRankedMatch")) { GameHandler.PlayMultiPlayerRankedMatch(this, packetMap["PlayMultiPlayerRankedMatch"]); }
                        if (packetMap.ContainsKey("PlayMultiPlayerQuickMatch"))  { GameHandler.PlayMultiPlayerQuickMatch (this, packetMap["PlayMultiPlayerQuickMatch"]); }
                        if (packetMap.ContainsKey("PlaySinglePlayerTutorial"))   { GameHandler.PlaySinglePlayerTutorial  (this, packetMap["PlaySinglePlayerTutorial"]); }
                        if (packetMap.ContainsKey("PlaySinglePlayerQuickMatch")) { GameHandler.PlaySinglePlayerQuickMatch(this, packetMap["PlaySinglePlayerQuickMatch"]); }
                        if (packetMap.ContainsKey("ProfileDataInfo"))            { ProfileHandler.ProfileDataInfo        (this); }
                        if (packetMap.ContainsKey("ProfilePageInfo"))            { ProfileHandler.ProfilePageInfo        (this, packetMap["ProfilePageInfo"]); }
                        if (packetMap.ContainsKey("RoomChatMessage"))            { RoomHandler.RoomChatMessage           (this, packetMap["RoomChatMessage"]); }
                        if (packetMap.ContainsKey("RoomEnter"))                  { RoomHandler.RoomEnter                 (this, packetMap["RoomEnter"]); }
                        if (packetMap.ContainsKey("RoomEnterMulti"))             { RoomHandler.RoomEnterMulti            (this, packetMap["RoomEnterMulti"]); }
                        if (packetMap.ContainsKey("RoomExit"))                   { RoomHandler.RoomExit                  (this, packetMap["RoomExit"]); }
                        if (packetMap.ContainsKey("RoomEnterFree"))              { RoomHandler.RoomEnterFree             (this, packetMap["RoomEnterFree"]); }
                        if (packetMap.ContainsKey("RoomsList"))                  { RoomHandler.RoomsList                 (this); }
                        if (packetMap.ContainsKey("SelectPreconstructed"))       { ProfileHandler.SelectPreconstructed   (this, packetMap["SelectPreconstructed"]); }
                        if (packetMap.ContainsKey("SellCards"))                  { StoreHandler.SellCards                (this, packetMap["SellCards"]); }
                        if (packetMap.ContainsKey("Whisper"))                    { RoomHandler.Whisper                   (this, packetMap["Whisper"]); }
                    }
                }
                else if (clientType == "Battle")
                {
                    if (account.authenticated == false)
                    {
                        if (packetMap.ContainsKey("Ping"))         { MiscHandler.Ping          (this); }
                        if (packetMap.ContainsKey("Reconnect"))    { SignInHandler.Reconnect   (this, packetMap["Reconnect"]); }
                        if (packetMap.ContainsKey("BattleSignIn")) { SignInHandler.BattleSignIn(this, packetMap["BattleSignIn"]); }
                    }
                    else
                    {
                        if (packetMap.ContainsKey("EndPhase"))      { BattleHandler.EndPhase     (this, packetMap["EndPhase"]); }
                        if (packetMap.ContainsKey("GameInfo"))      { BattleHandler.GameInfo     (this); }
                        if (packetMap.ContainsKey("LeaveGame"))     { BattleHandler.LeaveGame    (this); }
                        if (packetMap.ContainsKey("Ping"))          { MiscHandler.Ping           (this); }
                        if (packetMap.ContainsKey("PlayCardInfo"))  { BattleHandler.PlayCardInfo (this, packetMap["PlayCardInfo"]); }
                        if (packetMap.ContainsKey("SacrificeCard")) { BattleHandler.SacrificeCard(this, packetMap["SacrificeCard"]); }
                        if (packetMap.ContainsKey("Surrender"))     { BattleHandler.Surrender    (this); }
                    }
                }

                if (packetMap.Count != 0)
                {
                    foreach (KeyValuePair<string, string> packet in packetMap)
                    {
                        Console.WriteLine("Received unhandled packet: " + packet.Key);
                    }

                }
            }
            catch
            {
                Console.WriteLine("Failed to parse JSON data from received packet!");
            }
        }

        private Dictionary<string, string> PacketMap(string jsonString)
        {
            Dictionary<string, string> packetMap = new Dictionary<string, string>();

            jsonString = jsonString.Replace("\r\n", string.Empty).Replace("\n", string.Empty).Replace("\r", string.Empty).Replace("\t", string.Empty);

            int packetCount = 0;
            int startIndex  = 0;

            while ((startIndex = jsonString.IndexOf("}{", startIndex)) != -1)
            {
                startIndex += "}{".Length;
                packetCount++;
            }

            if (packetCount != 0)
            {
                for (int i = 0; i < (packetCount + 1); i++)
                {
                    DefaultMessage defaultMessage;
                    string subPacket;

                    if (i != packetCount)
                    {
                        int seperatorPosition = jsonString.IndexOf("}{");

                        subPacket  = jsonString.Substring(0, seperatorPosition + 1);
                        jsonString = jsonString.Remove(0, seperatorPosition + 1);

                        defaultMessage = JsonConvert.DeserializeObject<DefaultMessage>(subPacket);
                        
                        if (!packetMap.ContainsKey(defaultMessage.msg))
                        {
                            packetMap.Add(defaultMessage.msg, subPacket);
                        }

                    }
                    else
                    {
                        defaultMessage = JsonConvert.DeserializeObject<DefaultMessage>(jsonString);

                        if (!packetMap.ContainsKey(defaultMessage.msg))
                        {
                            packetMap.Add(defaultMessage.msg, jsonString);
                        }
                    }
                }
            }

            DefaultMessage lastPacket = JsonConvert.DeserializeObject<DefaultMessage>(jsonString);

            if (!packetMap.ContainsKey(lastPacket.msg))
            {
                packetMap.Add(lastPacket.msg, jsonString);
            }

            return packetMap;
        }

        private void Receive(IAsyncResult result)
        {
            try
            {
                Socket handler     = result.AsyncState as Socket;
                int recievedLength = clientSocket.EndReceive(result);

                if (recievedLength != 0)
                {
                    byte[] packetData = new byte[recievedLength];
                    Buffer.BlockCopy(dataBuffer, 0, packetData, 0, recievedLength);
                    string jsonString = Encoding.ASCII.GetString(packetData);

                    OnData(jsonString);

                    clientSocket.BeginReceive(dataBuffer, 0, dataBuffer.Length, SocketFlags.None, Receive, handler);
                }
                else
                {
                    Disconnect();
                }
            }
            catch (Exception ex)
            {
                Disconnect();

                Console.WriteLine(ex.Message);
            }
        }

        //TEMP
        public void Send(string jsonToSend)
        {
            try
            {
                byte[] buffer = Encoding.ASCII.GetBytes(jsonToSend);
                clientSocket.Send(buffer, 0, buffer.Length, SocketFlags.None);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public void Send(object packetToSend)
        {
            try
            {
                byte[] buffer = Encoding.ASCII.GetBytes(JsonConvert.SerializeObject(packetToSend, settings));
                clientSocket.Send(buffer, 0, buffer.Length, SocketFlags.None);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }
    }
}
