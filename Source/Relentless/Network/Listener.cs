using System;
using System.Net;
using System.Net.Sockets;
using System.Threading;

namespace Relentless.Network
{
    public class ListenerHandler
    {
        public static Listener Create(string type)
        {
            Listener listener = new Listener()
            {
                listenerType = type
            };

            return listener;
        }
    }

    public class Listener
    {
        public string listenerType;
        public bool   listenSocket = true;
        TcpListener   listener;

        public bool Start(string host, int port)
        {
            try
            {
                listener = new TcpListener(IPAddress.Parse(host), port);
                listener.Start();

                return true;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);

                return false;
            }
        }

        public void AcceptConnectionThread()
        {
            new Thread(AcceptConnection).Start();
        }

        async void AcceptConnection()
        {
            while (listenSocket)
            {
                Thread.Sleep(1);

                if (listener.Pending())
                {
                    Client client = new Client()
                    {
                        clientSocket = await listener.AcceptSocketAsync(),
                        clientType   = listenerType
                    };

                    client.OnConnect();
                }
            }
        }
    }
}
