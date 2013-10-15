using System.Collections.Generic;

namespace Relentless.Global
{
    public class TradeStatus
    {
        public bool trading;
        public int tradeId;
        public bool initiator;
        public string partner;
        public List<int> cardIds;
        public int gold;
        public bool accepted;

        public TradeStatus()
        {
            trading = false;
            cardIds = new List<int>();
        }
    }
}
