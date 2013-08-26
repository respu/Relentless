using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;

namespace Relentless.Handlers
{
    public class RuleHandler
    {
        public static List<CardInfo.Data.SelectableTiles.TileSet> HandleCardSelect(CardType cardType)
        {
            List<CardInfo.Data.SelectableTiles.TileSet> tileSets = new List<CardInfo.Data.SelectableTiles.TileSet>();

            foreach (string ability in cardType.rulesList.Split('|'))
            {
                switch (ability)
                {
                    default:
                        {
                            Console.WriteLine(ability);
                            break;
                        }
                }
            }

            return tileSets;
        }
    }
}
