using Newtonsoft.Json;
using Relentless.API;
using Relentless.Configuration;
using Relentless.Global;
using Relentless.Handlers;
using System;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class BattleHandler
    {
        public static void EndPhase(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("EndPhase");

            EndPhase endPhase = JsonConvert.DeserializeObject<EndPhase>(jsonPacketData);

            Battle battle = BattleAPI.GetBattle(client.account.username);

            //Note: Phase checking needs to be added
            switch (endPhase.phase)
            {
                case "Init":
                    {
                        battle.turn = 0;

                        for (int i = 0; i < 5; i++)
                        {
                            battle.idols[i] = 10;
                        }

                        for (int i = 0; i < 4; i++)
                        {
                            for (int ii = 0; ii < 2; ii++)
                            {
                                battle.resources[i, ii] = 0;
                            }
                        }

                        CardAPI.ShuffleDeck(battle.deck);

                        for (int i = 0; i < 5; i++)
                        {
                            Card card = CardAPI.DrawCard(battle);

                            battle.handMap.Add(card.id, card);
                        }

                        ActiveResources activeResources = new ActiveResources();

                        foreach (string resource in battle.deck.resources)
                        {
                            activeResources.types.Add(resource);
                        }

                        client.Send(activeResources);

                        BattleAPI.TurnBegin(client, battle);
                        BattleAPI.UpdateHand(client, battle);

                        battle.phase = "PreMain";
                        break;
                    }
                case "PreMain":
                    {
                        if (battle.turn != 1)
                        {
                            Card card = CardAPI.DrawCard(battle);

                            battle.handMap.Add(card.id, card);
                        }

                        BattleAPI.UpdateHand(client, battle);
                        BattleAPI.ResetResources(battle);
                        BattleAPI.ResourcesUpdate(client, battle);
                        BattleAPI.CreatureTick(client, battle);

                        battle.phase = "Main";
                        break;
                    }
                case "Main":
                    {
                        BattleAPI.CreatureAttack(client, battle);
                        BattleAPI.TurnBegin(client, battle);

                        break;
                    }
            }
        }

        public static void GameInfo(Client client)
        {
            client.packetMap.Remove("GameInfo");

            Battle battle         = BattleAPI.GetBattle(client.account.username);
            Client opponentClient = PlayerAPI.GetSession(battle.opponent, false);

            GameInfo gameInfo = new GameInfo();

            gameInfo.gameType          = battle.gameType;
            gameInfo.deck              = battle.deck.name;
            gameInfo.gameId            = 1;
            gameInfo.color             = battle.color;
            gameInfo.roundTimerSeconds = 90;
            gameInfo.phase             = battle.phase;
            gameInfo.rewardForIdolKill = 10;
            gameInfo.nodeId            = ConfigReader.lobbyHost;
            gameInfo.port              = ConfigReader.lobbyPort;

            Account whiteAccount; Account blackAccount;

            if (battle.color == "white")
            {
                gameInfo.white = client.account.username;
                gameInfo.black = battle.opponent;
                whiteAccount   = client.account;
                blackAccount   = opponentClient.account;
            }
            else
            {
                gameInfo.white = battle.opponent;
                gameInfo.black = client.account.username;
                whiteAccount   = opponentClient.account;
                blackAccount   = client.account;
            }

            gameInfo.whiteAvatar.profileId = whiteAccount.id;
            gameInfo.whiteAvatar.head      = whiteAccount.avatar.head;
            gameInfo.whiteAvatar.body      = whiteAccount.avatar.body;
            gameInfo.whiteAvatar.leg       = whiteAccount.avatar.leg;
            gameInfo.whiteAvatar.armBack   = whiteAccount.avatar.armBack;
            gameInfo.whiteAvatar.armFront  = whiteAccount.avatar.armFront;
            gameInfo.blackAvatar.profileId = blackAccount.id;
            gameInfo.blackAvatar.head      = blackAccount.avatar.head;
            gameInfo.blackAvatar.body      = blackAccount.avatar.body;
            gameInfo.blackAvatar.leg       = blackAccount.avatar.leg;
            gameInfo.blackAvatar.armBack   = blackAccount.avatar.armBack;
            gameInfo.blackAvatar.armFront  = blackAccount.avatar.armFront;

            client.Send(gameInfo);
        }

        public static void LeaveGame(Client client)
        {
            //Variables.battleMap.Remove(client.account.username);
        }

        public static void PlayCard(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("PlayCard");

            PlayCard playCard = JsonConvert.DeserializeObject<PlayCard>(jsonPacketData);

            Battle battle = BattleAPI.GetBattle(client.account.username);

            if (battle.handMap.ContainsKey(playCard.card))
            {
                NewEffects newEffects = new NewEffects();

                foreach (string positionData in playCard.data.positions)
                {
                    Card card         = CardAPI.GetCard(client, playCard.card);
                    CardType cardType = CardAPI.GetCardType(card.typeId);

                    if (BattleAPI.EnoughResources(battle, cardType))
                    {
                        BattleAPI.DecreaseResource(battle, cardType.GetResourceType(), cardType.GetResourceCost());

                        string[] positionDataArray = positionData.Split(',');

                        NewEffects.Effect.Target target = new NewEffects.Effect.Target();
                        target.color    = battle.color;
                        target.position = positionDataArray[1] + "," + positionDataArray[2];

                        NewEffects.Effect cardPlayedEffect  = new NewEffects.Effect();
                        NewEffects.Effect summonUnitEffect  = new NewEffects.Effect();
                        NewEffects.Effect statsUpdateEffect = new NewEffects.Effect();

                        cardPlayedEffect.CardPlayed       = new NewEffects.Effect.CardPlayedEffect();
                        cardPlayedEffect.CardPlayed.card  = card;
                        cardPlayedEffect.CardPlayed.color = battle.color;
                        cardPlayedEffect.CardPlayed.tile1 = target;

                        newEffects.effects.Add(cardPlayedEffect);

                        if (cardType.kind == "CREATURE" || cardType.kind == "STRUCTURE")
                        {
                            Creature creature = new Creature()
                            {
                                kind      = cardType.kind,
                                posX      = Convert.ToInt16(positionDataArray[2]),
                                posY      = Convert.ToInt16(positionDataArray[1]),
                                defaultHp = cardType.hp,
                                defaultAp = cardType.ap,
                                defaultAc = cardType.ac,
                                currentHp = cardType.hp,
                                currentAp = cardType.ap,
                                currentAc = cardType.ac
                            };

                            if (cardType.ac == -1)
                            {
                                creature.canTick = false;
                            }
                            else
                            {
                                creature.canTick = true;
                            }

                            foreach (string subType in cardType.subTypes)
                            {
                                creature.subTypes.Add(subType);
                            }

                            foreach (string rule in cardType.rulesList)
                            {
                                creature.ruleList.Add(rule);
                            }

                            summonUnitEffect.SummonUnit        = new NewEffects.Effect.SummonUnitEffect();
                            summonUnitEffect.SummonUnit.card   = card;
                            summonUnitEffect.SummonUnit.target = target;

                            newEffects.effects.Add(summonUnitEffect);

                            statsUpdateEffect.StatsUpdate        = new NewEffects.Effect.StatsUpdateEffect();
                            statsUpdateEffect.StatsUpdate.target = target;
                            statsUpdateEffect.StatsUpdate.hp     = creature.defaultHp;
                            statsUpdateEffect.StatsUpdate.ap     = creature.defaultAp;
                            statsUpdateEffect.StatsUpdate.ac     = creature.defaultAc;

                            newEffects.effects.Add(statsUpdateEffect);

                            RuleHandler.HandleCreatureStructureSummon(ref creature, battle);
                            battle.board[Convert.ToInt16(positionDataArray[2]), Convert.ToInt16(positionDataArray[1])] = creature;
                        }
                        if (cardType.kind == "ENCHANTMENT" || cardType.kind == "SPELL")
                        {
                            //RuleHandler.HandleEnchantmentSpellPlay(battle);
                        }

                        battle.handMap.Remove(playCard.card);

                        BattleAPI.ResourcesUpdate(client, battle);
                        BattleAPI.UpdateHand(client, battle);
                    }
                    else
                    {
                        Console.WriteLine("{0} tried to play card {1} but they don't have enough resources!", client.account.username, card.id);
                    }
                }

                client.Send(newEffects);
                BattleAPI.GetOpponentClient(battle).Send(newEffects);
            }
            else
            {
                Console.WriteLine("{0} tried to play card {1} which they don't have in hand!", client.account.username, playCard.card);
            }
        }

        public static void PlayCardInfo(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("PlayCardInfo");

            PlayCardInfo playCardInfo = JsonConvert.DeserializeObject<PlayCardInfo>(jsonPacketData);

            Battle battle = BattleAPI.GetBattle(client.account.username);

            if (battle.handMap.ContainsKey(playCardInfo.card))
            {
                Card card         = battle.handMap[playCardInfo.card];
                CardType cardType = CardAPI.GetCardType(card.typeId);

                CardInfo cardInfo = new CardInfo();
                cardInfo.card = card;

                if (BattleAPI.EnoughResources(battle, cardType))
                {
                    cardInfo.hasEnoughResources = true;
                    cardInfo.isPlayable         = true;

                    if (cardType.kind == "CREATURE" || cardType.kind == "STRUCTURE")
                    {
                        List<CardInfo.Data.SelectableTiles.TileSet> tileSets = new List<CardInfo.Data.SelectableTiles.TileSet>();

                        for (int i = 0; i < 5; i++)
                        {
                            for (int ii = 0; ii < 3; ii++)
                            {
                                if (battle.board[ii, i] == null)
                                {
                                    CardInfo.Data.SelectableTiles.TileSet tileSet = new CardInfo.Data.SelectableTiles.TileSet();
                                    tileSet.color    = battle.color;
                                    tileSet.position = i + "," + ii;

                                    tileSets.Add(tileSet);
                                }
                            }
                        }

                        cardInfo.data.selectableTiles.tileSets.Add(tileSets);
                    }
                    else
                    {
                        cardInfo.data.selectableTiles.tileSets.Add(RuleHandler.HandleCardSelect(battle, cardType));
                    }

                    if (cardType.targetArea == String.Empty)
                    {
                        cardType.targetArea = "TILE";
                    }
                    else
                    {
                        cardInfo.data.targetArea = cardType.targetArea;
                    }
                }
                else
                {
                    cardInfo.hasEnoughResources = false;
                    cardInfo.isPlayable         = false;

                    cardInfo.alerts.Add("Not enough resources");
                }

                client.Send(cardInfo);
            }
            else
            {
                Console.WriteLine("{0} requested card information on card {1} which they don't have in hand!", client.account.username, playCardInfo.card);
            }
        }

        public static void SacrificeCard(Client client, string jsonPacketData)
        {
            client.packetMap.Remove("SacrificeCard");

            SacrificeCard sacrificeCard = JsonConvert.DeserializeObject<SacrificeCard>(jsonPacketData);

            Battle battle = BattleAPI.GetBattle(client.account.username);

            if (battle.handMap.ContainsKey(sacrificeCard.card))
            {
                battle.handMap.Remove(sacrificeCard.card);

                if (sacrificeCard.resource == "cards")
                {
                    for (int i = 0; i < 2; i++)
                    {
                        Card card = CardAPI.DrawCard(battle);
                        battle.handMap.Add(card.id, card);
                    }
                }
                else
                {
                    BattleAPI.IncreaseResource(battle, sacrificeCard.resource, 1);
                }

                BattleAPI.ResourcesUpdate(client, battle);
                BattleAPI.UpdateHand(client, battle);

                NewEffects newEffects = new NewEffects();
                NewEffects.Effect cardSacrificedEffect = new NewEffects.Effect();

                cardSacrificedEffect.CardSacrificed          = new NewEffects.Effect.CardSacrificedEffect();
                cardSacrificedEffect.CardSacrificed.color    = battle.color;
                cardSacrificedEffect.CardSacrificed.resource = sacrificeCard.resource.ToUpper();

                BattleAPI.GetOpponentClient(battle).Send(newEffects);
            }
            else
            {
                Console.WriteLine("{0} tried to sacrifice the card {1} which they don't have in hand!", client.account.username, sacrificeCard.card);
            }
        }

        public static void Surrender(Client client)
        {
            client.packetMap.Remove("Surrender");

            Battle battle = BattleAPI.GetBattle(client.account.username);

            if (battle.phase != "End")
            {
                Battle.Stats whiteStats; Battle.Stats blackStats;
                string whiteProfileId; string blackProfileId;

                Battle opponentBattle = BattleAPI.GetOpponentBattle(battle);
                Client opponentClient = BattleAPI.GetOpponentClient(battle);

                battle.phase         = "End";
                opponentBattle.phase = "End";

                NewEffects newEffects = new NewEffects();

                NewEffects.Effect surrenderEffectEffect = new NewEffects.Effect();
                NewEffects.Effect endGameEffect         = new NewEffects.Effect();

                surrenderEffectEffect.SurrenderEffect       = new NewEffects.Effect.SurrenderEffectEffect();
                surrenderEffectEffect.SurrenderEffect.color = battle.color;

                endGameEffect.EndGame        = new NewEffects.Effect.EndGameEffect();
                endGameEffect.EndGame.winner = opponentBattle.color;

                if (battle.color == "white")
                {
                    whiteProfileId = client.account.id;
                    blackProfileId = "";

                    whiteStats = battle.stats;
                    blackStats = opponentBattle.stats;
                }
                else
                {
                    whiteProfileId = "";
                    blackProfileId = client.account.id;

                    whiteStats = opponentBattle.stats;
                    blackStats = battle.stats;
                }

                endGameEffect.EndGame.whiteStats.profileId          = whiteProfileId;
                endGameEffect.EndGame.whiteStats.idolDamage         = whiteStats.idolDamage;
                endGameEffect.EndGame.whiteStats.unitDamage         = whiteStats.unitDamage;
                endGameEffect.EndGame.whiteStats.unitsPlayed        = whiteStats.unitsPlayed;
                endGameEffect.EndGame.whiteStats.spellsPlayed       = whiteStats.spellsPlayed;
                endGameEffect.EndGame.whiteStats.enchantmentsPlayed = whiteStats.enchantmentsPlayed;
                endGameEffect.EndGame.whiteStats.scrollsDrawn       = whiteStats.scrollsDrawn;
                endGameEffect.EndGame.whiteStats.totalMs            = 0;
                endGameEffect.EndGame.whiteStats.mostDamageUnit     = 0;
                endGameEffect.EndGame.whiteStats.idolsDestroyed     = 0;

                endGameEffect.EndGame.blackStats.profileId          = blackProfileId;
                endGameEffect.EndGame.blackStats.idolDamage         = blackStats.idolDamage;
                endGameEffect.EndGame.blackStats.unitDamage         = blackStats.unitDamage;
                endGameEffect.EndGame.blackStats.unitsPlayed        = blackStats.unitsPlayed;
                endGameEffect.EndGame.blackStats.spellsPlayed       = blackStats.spellsPlayed;
                endGameEffect.EndGame.blackStats.enchantmentsPlayed = blackStats.enchantmentsPlayed;
                endGameEffect.EndGame.blackStats.scrollsDrawn       = blackStats.scrollsDrawn;
                endGameEffect.EndGame.blackStats.totalMs            = 0;
                endGameEffect.EndGame.blackStats.mostDamageUnit     = 0;
                endGameEffect.EndGame.blackStats.idolsDestroyed     = 0;

                endGameEffect.EndGame.whiteGoldReward.matchReward           = 0;
                endGameEffect.EndGame.whiteGoldReward.matchCompletionReward = 0;
                endGameEffect.EndGame.whiteGoldReward.idolsDestroyedReward  = 0;
                endGameEffect.EndGame.whiteGoldReward.totalReward           = 0;

                endGameEffect.EndGame.blackGoldReward.matchReward           = 0;
                endGameEffect.EndGame.blackGoldReward.matchCompletionReward = 0;
                endGameEffect.EndGame.blackGoldReward.idolsDestroyedReward  = 0;
                endGameEffect.EndGame.blackGoldReward.totalReward           = 0;

                newEffects.effects.Add(surrenderEffectEffect);
                newEffects.effects.Add(endGameEffect);

                client.Send(newEffects);
                opponentClient.Send(newEffects);
            }
            else
            {
                Console.WriteLine("{0} tried to surrender in a game that has already finished!", client.account.username);
            }
        }
    }
}
