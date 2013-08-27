using System.Collections.Generic;

namespace Relentless.Global
{
    public class Creature
    {
        public int currentHp;
        public int currentAp;
        public int currentAc;
        public int defaultHp;
        public int defaultAp;
        public int defaultAc;
        public List<string> ruleList;

        public Creature()
        {
            ruleList = new List<string>();
        }
    }
}
