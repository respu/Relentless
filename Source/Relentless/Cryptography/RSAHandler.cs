using System;
using System.Text;
using System.Security.Cryptography;

namespace Relentless.Cryptography
{
    public class Crypt
    {
        public static RSAHandler RSA = new RSAHandler();
    }

    public class RSAHandler
    {
        RSACryptoServiceProvider cryptographyProvider;

        public RSAHandler()
        {
            cryptographyProvider = new RSACryptoServiceProvider();
            cryptographyProvider.FromXmlString("THIS NEEDS TO BE REPLACED");
        }

        public string Decrypt(string stringToDecrypt)
        {
            string decryptedData;

            try
            {
                decryptedData = Encoding.ASCII.GetString(cryptographyProvider.Decrypt(Convert.FromBase64String(stringToDecrypt), false));
            }
            catch
            {
                decryptedData = "";
            }

            return decryptedData;
        }
    }
}
