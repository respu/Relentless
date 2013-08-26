﻿using Relentless.Database;
using Relentless.Global;
using Relentless.Network;

namespace Relentless.API
{
    public class PlayerAPI
    {
        public static Client GetSession(string identifier, bool isId)
        {
            if (isId == false)
            {
                return Variables.sessionMap[identifier];
            }
            else
            {
                foreach (var session in Variables.sessionMap)
                {
                    if (session.Value.account.id == identifier)
                    {
                        return session.Value;
                    }
                }
            }

            return null;
        }

        public static void IncreaseGold(Client client, int amount)
        {
            client.account.gold += amount;
            DB.Database.Execute(client.connection, true, true, "UPDATE account_data SET gold = ? WHERE guid = ?", client.account.gold, client.account.id);
        }

        public static bool IsOnline(string name)
        {
            return Variables.sessionMap.ContainsKey(name);
        }

        public static void KickPlayer(Client client, string reason)
        {
            FailMessage failMessage = new FailMessage();
            failMessage.op   = "Reconnect";
            failMessage.info = reason;

            client.Send(failMessage);

            FailMessage infoFailMessage = new FailMessage();
            infoFailMessage.info = reason;

            client.Send(infoFailMessage);

            Variables.sessionMap.Remove(client.account.username);
            client.account = new Account();   
        }

        public static void RemoveGold(Client client, int amount)
        {
            client.account.gold -= amount;
            DB.Database.Execute(client.connection, true, true, "UPDATE account_data SET gold = ? WHERE guid = ?", client.account.gold, client.account.id);
        }

        public static void RemoveShards(Client client, int amount)
        {
            client.account.shards -= amount;
            DB.Database.Execute(client.connection, true, true, "UPDATE account_data SET shards = ? WHERE guid = ?", client.account.shards, client.account.id);
        }
    }
}
