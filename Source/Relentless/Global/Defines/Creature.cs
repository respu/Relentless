using System.Collections.Generic;

namespace Relentless.Global
{
    public class Creature
    {
        public string kind;
        public int posX;
        public int posY;
        public int currentHp;
        public int currentAp;
        public int currentAc;
        public int defaultHp;
        public int defaultAp;
        public int defaultAc;
        public List<string> subTypes;
        public List<string> ruleList;
        public bool canTick;

        public Creature()
        {
            subTypes = new List<string>();
            ruleList = new List<string>();
        }
    }
}
