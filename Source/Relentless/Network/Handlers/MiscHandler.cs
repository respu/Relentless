using Newtonsoft.Json;
using Relentless.Configuration;
using Relentless.Database;
using Relentless.Global;
using System.Collections.Generic;

namespace Relentless.Network
{
    public static class MiscHandler
    {
        public static void GetTwitterFeed(Client client)
        {
            client.packetMap.Remove("GetTwitterFeed");
        }

        public static void LobbyLookup(Client client)
        {
            client.packetMap.Remove("LobbyLookup");

            LobbyLookup lobbyLookup = new LobbyLookup();
            lobbyLookup.ip   = ConfigReader.serverHost;
            lobbyLookup.port = ConfigReader.lobbyPort;

            client.Send(lobbyLookup);
        }

        public static void Ping(Client client)
        {
            client.packetMap.Remove("Ping");
        }

        public static void OverallStats(Client client)
        {
            client.packetMap.Remove("OverallStats");

            SQLResult serverStatsResult = DB.Database.Select(client.connection, true, false, "SELECT * FROM server_stats");
            SQLResult cardCountResult   = DB.Database.Select(client.connection, false, true, "SELECT COUNT(*) FROM account_cards");

            OverallStats overallStats = new OverallStats();
            overallStats.serverName        = ConfigReader.serverName;
            overallStats.loginsLast24h     = serverStatsResult.Read<int>(0, "loginsLast24h");
            overallStats.totalCards        = cardCountResult.Read  <int>(0, "COUNT(*)"); //Note: Maybe some sort of cache instead?
            overallStats.totalGoldRewarded = serverStatsResult.Read<int>(0, "totalGoldRewarded");
            overallStats.totalSoldCards    = serverStatsResult.Read<int>(0, "totalSoldCards"); ;
            overallStats.nrOfProfiles      = Variables.sessionMap.Count;

            client.Send(overallStats);
        }
    }
}
