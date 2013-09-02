using Relentless.API;
using Relentless.Global;
using Relentless.Network;
using System;
using System.Collections.Generic;

namespace Relentless.Handlers
{
    public class RuleHandler
    {
        public static void HandleCreatureStructureAttack(Client client, ref Creature creature, Battle battle)
        {
            bool attackingCreatureAlive = true;

            Battle opponentBattle = BattleAPI.GetOpponentBattle(battle);

            foreach (string ability in creature.ruleList)
            {
                switch (ability)
                {
                    case "AttackForward":
                    case "AttackForwardContinuous":
                    case "AttackForwardRanged":
                    case "AttackForwardRangedContinuous":
                        {
                            //TODO: Relentless creatures will attack but do not continue after the first creature

                            NewEffects.Effect.Target selfTarget = new NewEffects.Effect.Target();
                            selfTarget.color    = battle.color;
                            selfTarget.position = creature.posY + "," + creature.posX;

                            NewEffects newEffects = new NewEffects();

                            int opponentCreaturePosition = BattleAPI.CreatureOnRow(opponentBattle, creature);

                            if (opponentCreaturePosition >= 0)
                            {
                                bool opponentCreatureDestroyed;

                                Creature opponentCreature = opponentBattle.board[opponentCreaturePosition, creature.posY];

                                NewEffects.Effect.Target opponentTarget = new NewEffects.Effect.Target();
                                opponentTarget.color    = opponentBattle.color;
                                opponentTarget.position = opponentCreature.posY + "," + opponentCreature.posX;

                                if (creature.currentAp > opponentCreature.currentHp)
                                {
                                    opponentCreature.currentHp = 0;
                                    opponentCreatureDestroyed  = true;
                                }
                                else
                                {
                                    opponentCreature.currentHp -= creature.currentAp;
                                    opponentCreatureDestroyed   = false;
                                }

                                NewEffects.Effect unitAttackTileEffect = new NewEffects.Effect();
                                NewEffects.Effect damageUnitEffect     = new NewEffects.Effect();
                                NewEffects.Effect statsUpdateEffect    = new NewEffects.Effect();
                                
                                unitAttackTileEffect.UnitAttackTile        = new NewEffects.Effect.UnitAttackTileEffect();
                                unitAttackTileEffect.UnitAttackTile.source = selfTarget;
                                unitAttackTileEffect.UnitAttackTile.target = opponentTarget;

                                newEffects.effects.Add(unitAttackTileEffect);

                                damageUnitEffect.DamageUnit            = new NewEffects.Effect.DamageUnitEffect();
                                damageUnitEffect.DamageUnit.targetTile = opponentTarget;
                                damageUnitEffect.DamageUnit.amount     = creature.currentAp;
                                damageUnitEffect.DamageUnit.hp         = opponentCreature.currentHp;
                                damageUnitEffect.DamageUnit.kill       = opponentCreatureDestroyed;
                                damageUnitEffect.DamageUnit.attackType = "MELEE";    //Note: Can also be RANGED, maybe others too?
                                damageUnitEffect.DamageUnit.damageType = "PHYSICAL"; //Note: Unsure what else this can be or what difference it makes

                                newEffects.effects.Add(damageUnitEffect);

                                statsUpdateEffect.StatsUpdate    = new NewEffects.Effect.StatsUpdateEffect();
                                statsUpdateEffect.StatsUpdate.ac = opponentCreature.currentAc;
                                statsUpdateEffect.StatsUpdate.ap = opponentCreature.currentAp;
                                statsUpdateEffect.StatsUpdate.hp = opponentCreature.currentHp;

                                newEffects.effects.Add(statsUpdateEffect);

                                if (opponentCreatureDestroyed)
                                {
                                    opponentBattle.board[opponentCreature.posX, opponentCreature.posY] = null;

                                    NewEffects.Effect removeUnitEffect = new NewEffects.Effect();

                                    removeUnitEffect.RemoveUnit             = new NewEffects.Effect.RemoveUnitEffect();
                                    removeUnitEffect.RemoveUnit.removalType = "DESTROY"; //Note: Unsure what else this can be or what difference it makes
                                    removeUnitEffect.RemoveUnit.tile        = opponentTarget;

                                    newEffects.effects.Add(removeUnitEffect);
                                }
                            }
                            else
                            {
                                bool opponentIdolDestroyed;

                                NewEffects.Effect.Idol opponentIdol = new NewEffects.Effect.Idol();
                                opponentIdol.color    = opponentBattle.color;
                                opponentIdol.position = creature.posY;

                                if (creature.currentAp > opponentBattle.idols[creature.posY])
                                {
                                    opponentBattle.idols[creature.posY] = 0;

                                    opponentIdol.hp       = 0;
                                    opponentIdolDestroyed = true;
                                }
                                else
                                {
                                    opponentBattle.idols[creature.posY] -= creature.currentAp;

                                    opponentIdol.hp       = opponentBattle.idols[creature.posY];
                                    opponentIdolDestroyed = false;
                                }

                                NewEffects.Effect unitAttackIdolEffect = new NewEffects.Effect();
                                NewEffects.Effect damageIdolEffect     = new NewEffects.Effect();
                                NewEffects.Effect idolUpdateEffect     = new NewEffects.Effect();

                                unitAttackIdolEffect.UnitAttackIdol          = new NewEffects.Effect.UnitAttackIdolEffect();
                                unitAttackIdolEffect.UnitAttackIdol.attacker = selfTarget;
                                unitAttackIdolEffect.UnitAttackIdol.idol     = creature.posY;

                                newEffects.effects.Add(unitAttackIdolEffect);

                                damageIdolEffect.DamageIdol        = new NewEffects.Effect.DamageIdolEffect();
                                damageIdolEffect.DamageIdol.idol   = opponentIdol;
                                damageIdolEffect.DamageIdol.amount = creature.currentAp;
                                damageIdolEffect.DamageIdol.kill   = opponentIdolDestroyed;

                                newEffects.effects.Add(damageIdolEffect);

                                idolUpdateEffect.IdolUpdate      = new NewEffects.Effect.IdolUpdateEffect();
                                idolUpdateEffect.IdolUpdate.idol = opponentIdol;

                                newEffects.effects.Add(idolUpdateEffect);
                            }

                            if (attackingCreatureAlive)
                            {
                                NewEffects.Effect unitAttackDoneEffect = new NewEffects.Effect();

                                unitAttackDoneEffect.UnitAttackDone        = new NewEffects.Effect.UnitAttackDoneEffect();
                                unitAttackDoneEffect.UnitAttackDone.source = selfTarget;

                                newEffects.effects.Add(unitAttackDoneEffect);
                            }

                            client.Send(newEffects);
                            BattleAPI.GetOpponentClient(battle).Send(newEffects);

                            break;
                        }
                }
            }

            if (attackingCreatureAlive)
            {
                creature.currentAc = creature.defaultAc;

                BattleAPI.CreatureUpdate(client, battle, creature);
            }
        }

        public static void HandleCreatureStructureSummon(ref Creature creature, Battle battle)
        {
            foreach (string ability in creature.ruleList)
            {
            }
        }

        public static List<CardInfo.Data.SelectableTiles.TileSet> HandleCardSelect(Battle battle, CardType cardType)
        {
            List<CardInfo.Data.SelectableTiles.TileSet> tileSets = new List<CardInfo.Data.SelectableTiles.TileSet>();

            Battle opponentBattle = BattleAPI.GetOpponentBattle(battle);

            foreach (string ability in cardType.rulesList)
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
