using Relentless.Global;
using System.Collections.Generic;

namespace Relentless.Global
{
    public class Account
    {
        public bool authenticated;
        public string id;
        public string email;
        public string username;
        public string password;
        public bool signedIn;
        public bool acceptChallenges;
        public bool acceptTrades;
        public string adminRole;
        public int gold;
        public int shards;
        public int gamesPlayed;
        public int gamesWon;
        public int gamesSurrendered;
        public int selectedPreconstructed;
        public Avatar avatar;
        public Dictionary<int, Card> cardMap;
        public List<string> chatroomList;
        public Dictionary<string, Deck> deckMap;
        public List<int> deckValidate;
        public Dictionary<string, string> challengeMap;
        

        public Account()
        {
            authenticated = false;
            avatar        = new Avatar();
            cardMap       = new Dictionary<int, Card>();
            chatroomList  = new List<string>();
            deckMap       = new Dictionary<string, Deck>();
            deckValidate  = new List<int>();
            challengeMap  = new Dictionary<string, string>();
        }
    }
}
