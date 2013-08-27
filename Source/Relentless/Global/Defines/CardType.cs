namespace Relentless.Global
{
    public class CardType
    {
        public int id;
        public string kind;
        public string name;
        public string description;
        public string flavor;
        public string subTypesStr;
        public int rarity;
        public int hp;
        public int ap;
        public int ac;
        public int costDecay;
        public int costOrder;
        public int costGrowth;
        public int costEnergy;
        public string rulesList;
        public int cardImage;
        public int animationPreviewImage;
        public string animationPreviewInfo;
        public int animationBundle;
        public string abilities;
        public string targetArea;
        public string passiveRules;
        public string sound;
        public string soundProjectile;
        public int available;

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
