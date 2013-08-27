using Relentless.Configuration;
using Relentless.Global;
using Relentless.Network;
using System.Collections.Generic;

namespace Relentless.API
{
    public enum resourceType
    {
        decay  = 0,
        energy = 1,
        growth = 2,
        order  = 3
    };

    public class BattleAPI
    {
        public static bool EnoughResources(Battle battle, CardType cardType)
        {
            if (cardType.costDecay != 0)
            {
                if (battle.resources[(int)resourceType.decay, 0] >= cardType.costDecay)
                {
                    return true;
                }
            }
            else if (cardType.costEnergy != 0)
            {
                if (battle.resources[(int)resourceType.energy, 0] >= cardType.costEnergy)
                {
                    return true;
                }
            }
            else if (cardType.costGrowth != 0)
            {
                if (battle.resources[(int)resourceType.growth, 0] >= cardType.costGrowth)
                {
                    return true;
                }
            }
            else if (cardType.costOrder != 0)
            {
                if (battle.resources[(int)resourceType.order, 0] >= cardType.costOrder)
                {
                    return true;
                }
            }

            return false;
        }

        public static Battle GetBattle(string name)
        {
            return Variables.battleMap[name];
        }

        public static Battle GetOpponentBattle(Battle battle)
        {
            return Variables.battleMap[battle.opponent];
        }

        public static Client GetOpponentClient(Battle battle)
        {
            return Variables.sessionMap[battle.opponent];
        }

        public static void IncreaseResource(Client client, Battle battle, string resource, int amount)
        {
            switch (resource.ToLower())
            {
                case "decay":
                    {
                        battle.resources[(int)resourceType.decay, 0]++;
                        battle.resources[(int)resourceType.decay, 1]++;

                        break;
                    }
                case "energy":
                    {
                        battle.resources[(int)resourceType.energy, 0]++;
                        battle.resources[(int)resourceType.energy, 1]++;

                        break;
                    }
                case "growth":
                    {
                        battle.resources[(int)resourceType.growth, 0]++;
                        battle.resources[(int)resourceType.growth, 1]++;

                        break;
                    }
                case "order":
                    {
                        battle.resources[(int)resourceType.order, 0]++;
                        battle.resources[(int)resourceType.order, 1]++;

                        break;
                    }
            }
        }

        public static void Message(Battle battle, string from, string msg)
        {
            GameChatMessage gameChatMessage = new GameChatMessage();
            gameChatMessage.from = from;
            gameChatMessage.text = msg;

            BattleAPI.GetOpponentClient(battle).Send(gameChatMessage);
        }

        public static void Redirect(Client client)
        {
            BattleRedirect battleRedirect = new BattleRedirect();
            battleRedirect.ip   = ConfigReader.battleHost;
            battleRedirect.port = ConfigReader.battlePort;

            client.Send(battleRedirect);
        }

        public static void RemoveBattle(string name)
        {
            Variables.battleMap.Remove(name);
        }

        public static void ResourcesUpdate(Client client, Battle battle)
        {
            NewEffects newEffects = new NewEffects();

            NewEffects.Effect resourcesUpdateEffect = new NewEffects.Effect();
            resourcesUpdateEffect.ResourcesUpdate   = new NewEffects.Effect.ResourcesUpdateEffect();

            Battle whiteBattle; Battle blackBattle;

            if (battle.color == "white")
            {
                whiteBattle = battle;
                blackBattle = GetOpponentBattle(battle);
            }
            else
            {
                whiteBattle = GetOpponentBattle(battle);
                blackBattle = battle;
            }

            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.handSize = whiteBattle.handMap.Count;
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.handSize = blackBattle.handMap.Count;

            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.availableResources.DECAY  = whiteBattle.resources[(int)resourceType.decay, 0];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.availableResources.ENERGY = whiteBattle.resources[(int)resourceType.energy, 0];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.availableResources.GROWTH = whiteBattle.resources[(int)resourceType.growth, 0];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.availableResources.ORDER  = whiteBattle.resources[(int)resourceType.order, 0];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.outputResources.DECAY     = whiteBattle.resources[(int)resourceType.decay, 1];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.outputResources.ENERGY    = whiteBattle.resources[(int)resourceType.energy, 1];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.outputResources.GROWTH    = whiteBattle.resources[(int)resourceType.growth, 1];
            resourcesUpdateEffect.ResourcesUpdate.whiteAssets.outputResources.ORDER     = whiteBattle.resources[(int)resourceType.order, 1];

            resourcesUpdateEffect.ResourcesUpdate.blackAssets.availableResources.DECAY  = blackBattle.resources[(int)resourceType.decay, 0];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.availableResources.ENERGY = blackBattle.resources[(int)resourceType.energy, 0];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.availableResources.GROWTH = blackBattle.resources[(int)resourceType.growth, 0];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.availableResources.ORDER  = blackBattle.resources[(int)resourceType.order, 0];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.outputResources.DECAY     = blackBattle.resources[(int)resourceType.decay, 1];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.outputResources.ENERGY    = blackBattle.resources[(int)resourceType.energy, 1];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.outputResources.GROWTH    = blackBattle.resources[(int)resourceType.growth, 1];
            resourcesUpdateEffect.ResourcesUpdate.blackAssets.outputResources.ORDER     = blackBattle.resources[(int)resourceType.order, 1];

            newEffects.effects.Add(resourcesUpdateEffect);

            client.Send(newEffects);
            GetOpponentClient(battle).Send(newEffects);
        }

        public static void TurnBegin(Client client, Battle battle)
        {
            Battle opponentBattle = GetOpponentBattle(battle);

            battle.turn++;
            opponentBattle.turn++;

            NewEffects newEffects = new NewEffects();

            NewEffects.Effect turnBeginEffect = new NewEffects.Effect();
            turnBeginEffect.TurnBegin         = new NewEffects.Effect.TurnBeginEffect();

            turnBeginEffect.TurnBegin.turn = battle.turn;

            if (battle.turn != 1)
            {
                if (battle.turnColor == "white")
                {
                    battle.turnColor         = "black";
                    opponentBattle.turnColor = "black";

                    turnBeginEffect.TurnBegin.color = "black";
                }
                else
                {
                    battle.turnColor         = "white";
                    opponentBattle.turnColor = "white";

                    turnBeginEffect.TurnBegin.color = "white";
                }
            }
            else
            {
                turnBeginEffect.TurnBegin.color = battle.turnColor;
            }

            newEffects.effects.Add(turnBeginEffect);

            client.Send(newEffects);

            if (battle.turn != 1)
            {
                BattleAPI.GetOpponentClient(battle).Send(newEffects);
            }
        }

        public static void UpdateHand(Client client, Battle battle)
        {
            NewEffects newEffects = new NewEffects();

            NewEffects.Effect handUpdateEffect = new NewEffects.Effect();
            handUpdateEffect.HandUpdate        = new NewEffects.Effect.HandUpdateEffect();

            handUpdateEffect.HandUpdate.profileId = client.account.id;

            foreach (KeyValuePair<int, Card> card in battle.handMap)
            {
                handUpdateEffect.HandUpdate.cards.Add(card.Value);
            }

            newEffects.effects.Add(handUpdateEffect);

            client.Send(newEffects);
        }
    }
}
