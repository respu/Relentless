using Relentless.Global;

using System;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using System.Collections.Generic;

namespace Relentless.Network
{
    public class AssetHandler
    {
        public static void AvatarTypes(Client client)
        {
            client.packetMap.Remove("AvatarTypes");

            AvatarTypes avatarTypes = new AvatarTypes();

            foreach (KeyValuePair<int, AvatarType> avatarType in Variables.avatarTypeMap)
            {
                avatarTypes.types.Add(avatarType.Value);
            }

            client.Send(avatarTypes);
        }

        public static void CardTypes(Client client)
        {
            client.packetMap.Remove("CardTypes");

            CardTypes cardTypes = new CardTypes();

            foreach (KeyValuePair<int, CardType> cardType in Variables.cardTypeMap)
            {
                CardTypes.CardType packetCardType = new CardTypes.CardType();
                packetCardType.id          = cardType.Value.id;
                packetCardType.name        = cardType.Value.name;
                packetCardType.description = cardType.Value.description;
                packetCardType.flavor      = cardType.Value.flavor;
                packetCardType.subTypesStr = String.Join(",", cardType.Value.subTypes);
                packetCardType.kind        = cardType.Value.kind;
                packetCardType.rarity      = cardType.Value.rarity;
                packetCardType.hp          = cardType.Value.hp;
                packetCardType.ap          = cardType.Value.ap;
                packetCardType.ac          = cardType.Value.ac;
                packetCardType.costDecay   = cardType.Value.costDecay;
                packetCardType.costEnergy  = cardType.Value.costEnergy;
                packetCardType.costGrowth  = cardType.Value.costGrowth;
                packetCardType.costOrder   = cardType.Value.costOrder;

                if (cardType.Value.rulesList.Count != 0)
                {
                    packetCardType.rulesList = cardType.Value.rulesList;
                }

                packetCardType.cardImage = cardType.Value.cardImage;

                if (cardType.Value.animationPreviewImage != 0)
                {
                    packetCardType.animationPreviewImage = cardType.Value.animationPreviewImage;
                }
                if (!String.IsNullOrEmpty(cardType.Value.animationPreviewInfo))
                {
                    packetCardType.animationPreviewInfo = cardType.Value.animationPreviewInfo;
                }
                if (cardType.Value.animationBundle != 0)
                {
                    packetCardType.animationBundle = cardType.Value.animationBundle;
                }
                if (cardType.Value.abilities.Count != 0)
                {
                    packetCardType.abilities = new List<CardTypes.CardType.Ability>();

                    foreach (KeyValuePair<string, Ability> ability in cardType.Value.abilities)
                    {
                        CardTypes.CardType.Ability packetAbility = new CardTypes.CardType.Ability();
                        packetAbility.id          = ability.Key;
                        packetAbility.name        = ability.Value.name;
                        packetAbility.description = ability.Value.description;
                        packetAbility.cost.DECAY  = ability.Value.costDecay;
                        packetAbility.cost.ENERGY = ability.Value.costEnergy;
                        packetAbility.cost.GROWTH = ability.Value.costGrowth;
                        packetAbility.cost.ORDER  = ability.Value.costOrder;

                        packetCardType.abilities.Add(packetAbility);
                    }
                }
                if (!String.IsNullOrEmpty(cardType.Value.targetArea))
                {
                    packetCardType.targetArea = cardType.Value.targetArea;
                }
                if (cardType.Value.passiveRules.Count != 0)
                {
                    packetCardType.passiveRules = new List<CardTypes.CardType.PassiveRule>();

                    foreach (KeyValuePair<string, string> passiveRule in cardType.Value.passiveRules)
                    {
                        CardTypes.CardType.PassiveRule packetPassiveRule = new CardTypes.CardType.PassiveRule();
                        packetPassiveRule.displayName = passiveRule.Key;
                        packetPassiveRule.description = passiveRule.Value;

                        packetCardType.passiveRules.Add(packetPassiveRule);
                    }
                }
                if (!String.IsNullOrEmpty(cardType.Value.sound))
                {
                    packetCardType.sound = cardType.Value.sound;
                }
                if (!String.IsNullOrEmpty(cardType.Value.soundProjectile))
                {
                    packetCardType.soundProjectile = cardType.Value.soundProjectile;
                }

                cardTypes.cardTypes.Add(packetCardType);
            }

            client.Send(cardTypes);
        }
    }
}
