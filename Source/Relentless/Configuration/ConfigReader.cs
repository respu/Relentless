using Newtonsoft.Json;
using System;
using System.IO;
using System.Threading;

namespace Relentless.Configuration
{
    public static class ConfigReader
    {
        public static string mysqlHost;
        public static int    mysqlPort;
        public static string mysqlUsername;
        public static string mysqlPassword;
        public static string mysqlDatabase;
        public static string serverHost;
        public static int    routePort;
        public static int    lobbyPort;
        public static int    battlePort;
        public static string serverName;
        public static int    serverMaxPlayers;
        public static int    goldMultiplier;
        public static int    maxRooms;
        public static int    roomMaxPlayers;
        public static string roomList;
        public static int    sellCommon;
        public static int    sellUncommon;
        public static int    sellRare;

        public static void Load()
        {
            try
            {
                Config configuration = JsonConvert.DeserializeObject<Config>(File.ReadAllText("settings.conf"));

                mysqlHost        = configuration.mysql.host;
                mysqlPort        = configuration.mysql.port;
                mysqlUsername    = configuration.mysql.username;
                mysqlPassword    = configuration.mysql.password;
                mysqlDatabase    = configuration.mysql.database;
                serverHost       = configuration.network.serverHost;
                routePort        = configuration.network.routePort;
                lobbyPort        = configuration.network.lobbyPort;
                battlePort       = configuration.network.battlePort;
                serverName       = configuration.server.general.name;
                serverMaxPlayers = configuration.server.general.maxPlayers;
                goldMultiplier   = configuration.server.general.goldMultiplier;
                maxRooms         = configuration.server.room.maxRooms;
                roomMaxPlayers   = configuration.server.room.maxPlayers;
                roomList         = configuration.server.room.roomList;
                sellCommon       = configuration.server.shop.sellCommon;
                sellUncommon     = configuration.server.shop.sellUncommon;
                sellRare         = configuration.server.shop.sellRare;
            }
            catch
            {
                Console.WriteLine("Failed to load the configuration file. Trying again in 5 seconds...");
                Thread.Sleep(5000);

                Load();
            }
        }
    }
}
