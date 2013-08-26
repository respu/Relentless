using Relentless.API;
using Relentless.Global;
using Relentless.Network;
using System.Collections.Generic;
using System.Threading;

namespace Relentless.Handlers
{
    public class RoomChatHandler
    {
        public static void HandleCommand(Client client, string roomName, string command)
        {
            string[] chatArguments = command.Split(' ');

            switch (chatArguments[0])
            {
                case "help":
                    {
                        if (chatArguments.Length == 1)
                        {
                            RoomAPI.Message(roomName, "Scrolls", "Usage: /help or /help <command>\nCommands: \n- help\n- join\n- whisper\n- friend\n- ignore\n- report\n");
                        }
                        else
                        {
                            Dictionary<string, string> commandHelpMap = new Dictionary<string, string>();

                            commandHelpMap.Add("friend",  "Command: friend\nManages your friend list.\n/friend {add|remove|list} [username]. Shorthand: /f a, /f r, /f l)");
                            commandHelpMap.Add("help",    "Command: help\nDisplays the list of commands or help for an individual command.\n/help or /help <command>");
                            commandHelpMap.Add("ignore",  "Command: ignore\nManages your ignore list (hides chat, challenges and trade requests).\n/ignore {add|remove|list} [username]. Shorthand: /i a, /i r, /i l)");
                            commandHelpMap.Add("join",    "Command: join\nJoins the given room in the chat, or creates and joins the room if it didn't already exist.\n/join <roomName> or /j <roomName>");
                            commandHelpMap.Add("report",  "Command: report\nReports a given user for misconduct. Abuse of the report system will not be tolerated.\n/report <username> <reason>");
                            commandHelpMap.Add("whisper", "Command: whisper\nSends a whisper message to the given user.\n/whisper <username> <message> or /w <username> <message>");

                            if (commandHelpMap.ContainsKey(chatArguments[1]))
                            {
                                RoomAPI.Message(roomName, "Scrolls", commandHelpMap[chatArguments[1]]);
                            }
                            else
                            {
                                RoomAPI.Message(roomName, "Scrolls", "No such command: " + chatArguments[1]);
                            }
                        }

                        break;
                    }
                case "reconnect":
                    {
                        if (Variables.battleMap.ContainsKey(client.account.username))
                        {
                            RoomAPI.Message(roomName, "Scrolls", "Reconnecting to your last game in 5 seconds...");
                            Thread.Sleep(5000);

                            BattleAPI.Redirect(client);
                        }
                        else
                        {
                            RoomAPI.Message(roomName, "Scrolls", "You have no game pending for reconnection!");
                        }

                        break;
                    }
                case "w":
                case "whisper":
                    {
                        if (chatArguments.Length == 3)
                        {
                            if (PlayerAPI.IsOnline(chatArguments[1]))
                            {
                                RoomAPI.Whisper(chatArguments[1], client.account.username, chatArguments[2]);
                            }
                            else
                            {
                                RoomAPI.Message(roomName, "Scrolls", "That user is not online.");
                            }
                        }
                        else
                        {
                            RoomAPI.Message(roomName, "Scrolls", "Whisper takes <username> <message> as arguments.");
                        }

                        break;
                    }
                default:
                    {
                        RoomAPI.Message(roomName, "Scrolls", "No such action");
                        break;
                    }
            }
        }
    }
}
