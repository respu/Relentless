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
            //The default RSA keys are provided for convenience and should not be used outside of a development environment!
            //Public Key: <RSAKeyValue><Modulus>xBkjlDA0PpOaEp+PefFN9QV2vr46QnIabq7GXXCMQRk5Wp3OI01NCxSUB+RWaeCh+ArVs0uHetcj+QagrUzjg9BotqyrmQCR4wuarKRoqUQGGujvIBPk50k/ALPd+75gkU4+fvlfRNHt2rOsCw7XVUKdxh/VWo/6L3RpGw83QOU=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>

            cryptographyProvider = new RSACryptoServiceProvider();
            cryptographyProvider.FromXmlString("<RSAKeyValue><Modulus>xBkjlDA0PpOaEp+PefFN9QV2vr46QnIabq7GXXCMQRk5Wp3OI01NCxSUB+RWaeCh+ArVs0uHetcj+QagrUzjg9BotqyrmQCR4wuarKRoqUQGGujvIBPk50k/ALPd+75gkU4+fvlfRNHt2rOsCw7XVUKdxh/VWo/6L3RpGw83QOU=</Modulus><Exponent>AQAB</Exponent><P>+88yV33/NOLtkotU2WseH9QKiQLskgj3tGHv/77rETgo+wg+4kNB8jy61wpG6lAgYJlWG9Uh/Ba1fm5nXc7BWw==</P><Q>x1yXdtEKyjigT5UxOpWk7PReqqMWnNa67o3mq6erH+V3umSJkByAJ1aK+BaL9yRddu8gS9L98kNGF7CuI+Favw==</Q><DP>PddJ1sDjzzo3/Dhpsyeic1Cg8bsdHFRFeTBgP5/EnSr8rYH955V6+aG+hRdKCTt6aB7gTd+PBBkTo6Q7kIc5Zw==</DP><DQ>gRklgCyYRyFqNn7PNTfIaCVK1EbuErw+qtI7KLdX6jzHTm1iY28BUfgJ3+OB2ZWz7JunF1LXXbVQw3CHI/b/sw==</DQ><InverseQ>K3oZIqkvheMBFq+/985c2XDPRmsdzB/L4IwuwfsBV7nhRLIqV0if2pAmt67dBydz2mPtHoXKsVptTnizC2Tsxw==</InverseQ><D>bQ2F6b088KfpAP5XLftx3RciyETF5XnLFU6A5inW9cTvTmN/5cXxWH4jLJhhLhRMPsLXwRP5zeijCrQS2w1tYD+4aAno82ZexlGAqr2X6kFCP/ePJ1B9qp/qWnfG3mTGm0KBLb65jZq0VSUb/yvOUfotKd5E2NxVWUL/a0Mfquk=</D></RSAKeyValue>");
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
