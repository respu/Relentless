using System.Collections.Generic;

namespace Relentless.Global
{
    public class CardType
    {
        public int id;
        public string kind;
        public string name;
        public string description;
        public string flavor;
        public List<string> subTypes;
        public int rarity;
        public int hp;
        public int ap;
        public int ac;
        public int costDecay;
        public int costOrder;
        public int costGrowth;
        public int costEnergy;
        public List<string> rulesList;
        public int cardImage;
        public int animationPreviewImage;
        public string animationPreviewInfo;
        public int animationBundle;
        public Dictionary<string, Ability> abilities;
        public string targetArea;
        public Dictionary<string, string> passiveRules;
        public string sound;
        public string soundProjectile;
        public int available;

        public CardType()
        {
            abilities    = new Dictionary<string, Ability>();
            passiveRules = new Dictionary<string, string>();
            rulesList    = new List<string>();
            subTypes     = new List<string>();
        }

        public int GetResourceCost()
        {
            if (costDecay != 0)
            {
                return costDecay;
            }
            if (costEnergy != 0)
            {
                return costEnergy;
            }
            if (costGrowth != 0)
            {
                return costGrowth;
            }
            if (costOrder != 0)
            {
                return costOrder;
            }

            return 0;
        }

        public string GetResourceType()
        {
            if (costDecay != 0)
            {
                return "DECAY";
            }
            if (costEnergy != 0)
            {
                return "ENERGY";
            }
            if (costGrowth != 0)
            {
                return "GROWTH";
            }
            if (costOrder != 0)
            {
                return "ORDER";
            }

            return "";
        }
    }
}
