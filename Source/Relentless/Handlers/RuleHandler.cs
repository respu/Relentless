using Relentless.API;
using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;

namespace Relentless.Handlers
{
    public class RuleHandler
    {
        public static void HandleCreatureStructureSummon(ref Creature creature, Battle battle, int posX, int posY)
        {
            foreach (string ability in creature.ruleList)
            {
            }
        }

        public static List<CardInfo.Data.SelectableTiles.TileSet> HandleCardSelect(Battle battle, CardType cardType)
        {
            List<CardInfo.Data.SelectableTiles.TileSet> tileSets = new List<CardInfo.Data.SelectableTiles.TileSet>();

            Battle opponentBattle = BattleAPI.GetOpponentBattle(battle);

            foreach (string ability in cardType.rulesList.Split('|'))
            {
                switch (ability)
                {
                    //Select all creatures and structures on both sides of the board
                    case "Animovore":
                    case "Atrophy":
                    case "BearPaw":
                    case "BlessingOfHaste":
                    case "Bloodboil":
                    case "Burn":
                    case "ChampionRing":
                    case "ClusterHex":
                    case "CrownOfStrength":
                    case "CurseAttacker":
                    case "DamageOneOnDamage":
                    case "ElanVital":
                    case "EmberBonds":
                    case "Focus":
                    case "FrostWind":
                    case "Hymn":
                    case "IllthornSeed":
                    case "IronWhip":
                    case "Kabonk":
                    case "Languid":
                    case "MagmaPack":
                    case "MireCurse":
                    case "PlateArmor":
                    case "Plating":
                    case "Pother":
                    case "PotionOfResistance":
                    case "Regeniture":
                    case "ResonantHelm":
                    case "Spark":
                    case "Speed":
                    case "StagHeart":
                    case "ThoughtTrap":
                    case "ThunderSurge":
                    case "ViolentDispersal":
                    case "VitriolAura":
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                for (int ii = 0; ii < 3; ii++)
                                {
                                    if (battle.board[ii, i] != null)
                                    {
                                        TileSet(tileSets, battle.color, ii, i);
                                    }
                                    if (opponentBattle.board[ii, i] != null)
                                    {
                                        TileSet(tileSets, opponentBattle.color, ii, i);
                                    }
                                }
                            }

                            break;
                        }

                    //Select all creatures on both sides of the board
                    case "BindingRoot":
                    case "BlastStrike":
                    case "BlindRage":
                    case "BrainLice":
                    case "DamningCurse":
                    case "DeathCapBerserk":
                    case "DecCountdownOnCreatureDeathEnch":
                    case "Desperation":
                    case "DivineMark":
                    case "DryadicPower":
                    case "EnergySiphon":
                    case "HexMarks":
                    case "InfectiousBlight":
                    case "LeechingRing":
                    case "MetalHeart":
                    case "Pestis":
                    case "RangersBane":
                    case "Redesign":
                    case "RoastedBeanPotion":
                    case "ShroudOfUnlife":
                    case "UnleashInnerPower":
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                for (int ii = 0; ii < 3; ii++)
                                {
                                    Creature creature         = battle.board[ii, i];
                                    Creature opponentCreature = opponentBattle.board[ii, i];

                                    if (creature != null && creature.kind == "CREATURE")
                                    {
                                        TileSet(tileSets, battle.color, ii, i);
                                    }
                                    if (opponentCreature != null && opponentCreature.kind == "CREATURE")
                                    {
                                        TileSet(tileSets, opponentBattle.color, ii, i);
                                    }
                                }
                            }

                            break;
                        }

                    //Select all structures on both sides of the board
                    case "Overdrive":
                    case "Rigged":
                    case "TickBomb":
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                for (int ii = 0; ii < 3; ii++)
                                {
                                    Creature creature         = battle.board[ii, i];
                                    Creature opponentCreature = opponentBattle.board[ii, i];

                                    if (creature != null && creature.kind == "STRUCTURE")
                                    {
                                        TileSet(tileSets, battle.color, ii, i);
                                    }
                                    if (opponentCreature != null && opponentCreature.kind == "STRUCTURE")
                                    {
                                        TileSet(tileSets, opponentBattle.color, ii, i);
                                    }
                                }
                            }

                            break;
                        }

                    //Select all creatures and structures on your side of the board
                    case "FaithBlessing":
                    case "Metempsychosis":
                    case "Nutrition":
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                for (int ii = 0; ii < 3; ii++)
                                {
                                    if (battle.board[ii, i] != null)
                                    {
                                        TileSet(tileSets, battle.color, ii, i);
                                    }
                                }
                            }

                            break;
                        }

                    //Select all creatures on your side of the board
                    case "Callback":
                    case "FertileSoil":
                    case "GrislyGraft":
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                for (int ii = 0; ii < 3; ii++)
                                {
                                    Creature creature = battle.board[ii, i];

                                    if (creature != null && creature.kind == "CREATURE")
                                    {
                                        TileSet(tileSets, battle.color, ii, i);
                                    }
                                }
                            }

                            break;
                        }

                    //Select all creatures and structures on your opponents side of the board
                    case "Pushback":
                        {
                            for (int i = 0; i < 5; i++)
                            {
                                for (int ii = 0; ii < 3; ii++)
                                {
                                    if (opponentBattle.board[ii, i] != null)
                                    {
                                        TileSet(tileSets, battle.color, ii, i);
                                    }
                                }
                            }

                            break;
                        }
                }
            }

            return tileSets;
        }

        private static void TileSet(List<CardInfo.Data.SelectableTiles.TileSet> tileSets, string color, int posX, int posY)
        {
            CardInfo.Data.SelectableTiles.TileSet tileSet = new CardInfo.Data.SelectableTiles.TileSet();
            tileSet.color    = color;
            tileSet.position = posY + "," + posX;

            tileSets.Add(tileSet);
        }
    }
}
