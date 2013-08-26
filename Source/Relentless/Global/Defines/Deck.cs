using System.Collections.Generic;

namespace Relentless.Global
{
    public class Deck
    {
        public string name;
        public List<string> resources;
        public long timestamp;
        public string metadata;
        public List<Card> cards;
        public bool valid;

        public Deck()
        {
            resources = new List<string>();
            cards     = new List<Card>();
        }
    }
}
