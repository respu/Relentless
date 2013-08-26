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

        //TEMP
        public static void CardTypes(Client client)
        {
            client.packetMap.Remove("CardTypes");

            StringBuilder stringBuilder = new StringBuilder();
            StringWriter stringWriter = new StringWriter(stringBuilder);

            JsonWriter jsonWriter = new JsonTextWriter(stringWriter);
            jsonWriter.Formatting = Formatting.None;

            jsonWriter.WriteStartObject();
            jsonWriter.WritePropertyName("msg");
            jsonWriter.WriteValue("CardTypes");
            jsonWriter.WritePropertyName("cardTypes");
            jsonWriter.WriteStartArray();

            foreach (KeyValuePair<int, CardType> card in Variables.cardTypeMap)
            {
                CardType cardType = card.Value;
                jsonWriter.WriteStartObject();

                jsonWriter.WritePropertyName("id");
                jsonWriter.WriteValue(cardType.id);
                jsonWriter.WritePropertyName("name");
                jsonWriter.WriteValue(cardType.name);
                jsonWriter.WritePropertyName("description");
                jsonWriter.WriteValue(cardType.description);
                jsonWriter.WritePropertyName("flavor");
                jsonWriter.WriteValue(cardType.flavor);
                jsonWriter.WritePropertyName("subTypesStr");
                jsonWriter.WriteValue(cardType.subTypesStr);
                jsonWriter.WritePropertyName("kind");
                jsonWriter.WriteValue(cardType.kind);
                jsonWriter.WritePropertyName("rarity");
                jsonWriter.WriteValue(cardType.rarity);
                jsonWriter.WritePropertyName("hp");
                jsonWriter.WriteValue(cardType.hp);
                jsonWriter.WritePropertyName("ap");
                jsonWriter.WriteValue(cardType.ap);
                jsonWriter.WritePropertyName("ac");
                jsonWriter.WriteValue(cardType.ac);
                jsonWriter.WritePropertyName("costDecay");
                jsonWriter.WriteValue(cardType.costDecay);
                jsonWriter.WritePropertyName("costOrder");
                jsonWriter.WriteValue(cardType.costOrder);
                jsonWriter.WritePropertyName("costGrowth");
                jsonWriter.WriteValue(cardType.costGrowth);
                jsonWriter.WritePropertyName("costEnergy");
                jsonWriter.WriteValue(cardType.costEnergy);

                if (!String.IsNullOrEmpty(cardType.rulesList))
                {
                    jsonWriter.WritePropertyName("rulesList");
                    jsonWriter.WriteStartArray();

                    string[] rules = cardType.rulesList.Split('|');

                    for (int i = 0; i < Convert.ToInt16(rules[0]); i++)
                    {
                        jsonWriter.WriteValue(rules[i + 1]);
                    }

                    jsonWriter.WriteEnd();
                }

                jsonWriter.WritePropertyName("cardImage");
                jsonWriter.WriteValue(cardType.cardImage);

                if (cardType.animationPreviewImage != 0)
                {
                    jsonWriter.WritePropertyName("animationPreviewImage");
                    jsonWriter.WriteValue(cardType.animationPreviewImage);
                }

                if (!String.IsNullOrEmpty(cardType.animationPreviewInfo))
                {
                    jsonWriter.WritePropertyName("animationPreviewInfo");
                    jsonWriter.WriteValue(cardType.animationPreviewInfo);
                }

                if (cardType.animationBundle != 0)
                {
                    jsonWriter.WritePropertyName("animationBundle");
                    jsonWriter.WriteValue(cardType.animationBundle);
                }

                if (!String.IsNullOrEmpty(cardType.abilities))
                {
                    jsonWriter.WritePropertyName("abilities");
                    jsonWriter.WriteStartArray();

                    string[] abilities = cardType.abilities.Split('|');

                    for (int i = 0; i < Convert.ToInt16(abilities[0]); i++)
                    {
                        jsonWriter.WriteStartObject();

                        jsonWriter.WritePropertyName("id");
                        jsonWriter.WriteValue(abilities[(i * 7) + 1]);
                        jsonWriter.WritePropertyName("name");
                        jsonWriter.WriteValue(abilities[(i * 7) + 2]);
                        jsonWriter.WritePropertyName("description");
                        jsonWriter.WriteValue(abilities[(i * 7) + 3]);

                        jsonWriter.WritePropertyName("cost");
                        jsonWriter.WriteStartObject();

                        jsonWriter.WritePropertyName("DECAY");
                        jsonWriter.WriteValue(abilities[(i * 7) + 4]);
                        jsonWriter.WritePropertyName("ORDER");
                        jsonWriter.WriteValue(abilities[(i * 7) + 5]);
                        jsonWriter.WritePropertyName("ENERGY");
                        jsonWriter.WriteValue(abilities[(i * 7) + 6]);
                        jsonWriter.WritePropertyName("GROWTH");
                        jsonWriter.WriteValue(abilities[(i * 7) + 7]);

                        jsonWriter.WriteEndObject();

                        jsonWriter.WriteEndObject();
                    }

                    jsonWriter.WriteEnd();
                }

                if (!String.IsNullOrEmpty(cardType.targetArea))
                {
                    jsonWriter.WritePropertyName("targetArea");
                    jsonWriter.WriteValue(cardType.targetArea);
                }

                if (!String.IsNullOrEmpty(cardType.passiveRules))
                {
                    jsonWriter.WritePropertyName("passiveRules");
                    jsonWriter.WriteStartArray();

                    string[] rules = cardType.passiveRules.Split('|');

                    for (int i = 0; i < Convert.ToInt16(rules[0]); i++)
                    {
                        jsonWriter.WriteStartObject();

                        jsonWriter.WritePropertyName("displayName");
                        jsonWriter.WriteValue(rules[(i * 2) + 1]);
                        jsonWriter.WritePropertyName("description");
                        jsonWriter.WriteValue(rules[(i * 2) + 2]);

                        jsonWriter.WriteEndObject();
                    }

                    jsonWriter.WriteEnd();
                }

                if (!String.IsNullOrEmpty(cardType.sound))
                {
                    jsonWriter.WritePropertyName("sound");
                    jsonWriter.WriteValue(cardType.sound);
                }

                if (!String.IsNullOrEmpty(cardType.soundProjectile))
                {
                    jsonWriter.WritePropertyName("soundProjectile");
                    jsonWriter.WriteValue(cardType.soundProjectile);
                }

                jsonWriter.WritePropertyName("available");
                jsonWriter.WriteValue(cardType.available);

                jsonWriter.WriteEndObject();
            }

            jsonWriter.WriteEnd();
            jsonWriter.WriteEndObject();

            client.Send(stringBuilder.ToString());
        }
    }
}
