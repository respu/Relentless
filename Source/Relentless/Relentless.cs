using System;

namespace Relentless
{
    class Relentless
    {
        static void Main()
        {
            Console.Title = "Relentless - Version 0.105.0";
            Console.WriteLine("Relentless - Version 0.105.0: Public repository build");

            Initialise.Configuration();
            Initialise.Rooms();
            Initialise.Database();
            Initialise.Assets();
            Initialise.Network();

            Console.WriteLine("\nAwaiting connections...");
        }
    }
}
