using System.Collections.Generic;

namespace Relentless.Global
{
    public class Battle
    {
        public string color;
        public string opponent;
        public string gameType;
        public Deck deck;
        public string phase;
        public int turn;
        public string turnColor;
        public Dictionary<int, Card> handMap;
        public Dictionary<int, Card> discardMap;
        public int[] idols;
        public int[,] resources;
        public Creature[,] board;
        public Stats stats;

        public Battle()
        {
            discardMap = new Dictionary<int, Card>();
            handMap    = new Dictionary<int, Card>();
            idols      = new int[5];
            resources  = new int[4, 2];
            board      = new Creature[3, 5];
            stats      = new Stats();
        }

        public class Stats
        {
            public int idolDamage;
            public int unitDamage;
            public int unitsPlayed;
            public int spellsPlayed;
            public int enchantmentsPlayed;
            public int scrollsDrawn;

            public Stats()
            {
                idolDamage         = 0;
                unitDamage         = 0;
                unitsPlayed        = 0;
                spellsPlayed       = 0;
                enchantmentsPlayed = 0;
                scrollsDrawn       = 0;
            }
        }
    }
}
