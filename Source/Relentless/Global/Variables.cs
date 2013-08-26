using MySql.Data.MySqlClient;
using Relentless.Database;
using Relentless.Network;
using System;
using System.Collections.Generic;

namespace Relentless.Global
{
    public class Variables
    {
        public static string assetUrl                              = "http://download.scrolls.com/assets/";
        public static Dictionary<int, AvatarType> avatarTypeMap    = new Dictionary<int, AvatarType>();
        public static Dictionary<string, Battle> battleMap         = new Dictionary<string, Battle>();
        public static Dictionary<int, CardType> cardTypeMap        = new Dictionary<int, CardType>();
        public static Dictionary<int, CardType> cardTypeDecayMap   = new Dictionary<int, CardType>();
        public static Dictionary<int, CardType> cardTypeEnergyMap  = new Dictionary<int, CardType>();
        public static Dictionary<int, CardType> cardTypeGrowthMap  = new Dictionary<int, CardType>();
        public static Dictionary<int, CardType> cardTypeOrderMap   = new Dictionary<int, CardType>();
        public static Dictionary<string, List<string>> chatRoomMap = new Dictionary<string,List<string>>();
        public static MySqlConnection connection                   = new MySqlConnection(MySQLHandler.connectionString);
        public static Dictionary<string, List<int>> deckTypeMap    = new Dictionary<string, List<int>>();
        public static string serverVersion                         = "0.105.0";
        public static Dictionary<string, Client> sessionMap        = new Dictionary<string, Client>();
        public static Dictionary<int, StoreItem> storeItemMap      = new Dictionary<int, StoreItem>();
        public static Dictionary<int, Trial> trialMap              = new Dictionary<int, Trial>();
    }
}
