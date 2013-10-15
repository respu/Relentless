using System.Collections.Generic;

namespace Relentless.Configuration
{
    public class Config
    {
        public MySql mysql;
        public Network network;
        public Server server;

        public class MySql
        {
            public string host; 
            public int port;
            public string username;
            public string password;
            public string database;
        }

        public class Network
        {
            public string serverHost;
            public int routePort;
            public int lobbyPort;
            public int battlePort;
        }

        public class Server
        {
            public General general;
            public Room room;
            public Shop shop;

            public class General
            {
                public string name;
                public int maxPlayers;
                public int goldMultiplier;
            }

            public class Room
            {
                public int maxRooms;
                public int maxPlayers;
                public string roomList;
            }

            public class Shop
            {
                public int sellCommon;
                public int sellUncommon;
                public int sellRare;
            }
        }
    }
}
