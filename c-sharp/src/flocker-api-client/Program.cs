using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace flocker_api_client
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var CONTROL_SERVICE = Environment.GetEnvironmentVariable("CONTROL_SERVICE") ?? "54.157.8.57";
            var CONTROL_PORT = Environment.GetEnvironmentVariable("CONTROL_PORT") ?? "4523";
            var KEY_FILE = Environment.GetEnvironmentVariable("KEY_FILE") ?? "/Users/kai/projects/flocker-api-examples/flockerdemo.key";
            var CERT_FILE = Environment.GetEnvironmentVariable("CERT_FILE") ?? "/Users/kai/projects/flocker-api-examples/flockerdemo.crt";
            var CA_FILE = Environment.GetEnvironmentVariable("CA_FILE") ?? "/Users/kai/projects/flocker-api-examples/cluster.crt";

            FileExistsOrDie(KEY_FILE, nameof(KEY_FILE));
            FileExistsOrDie(CERT_FILE, nameof(CERT_FILE));
            FileExistsOrDie(CA_FILE, nameof(CA_FILE));

            var keyContents = File.ReadAllBytes(KEY_FILE);
            var certContents = File.ReadAllBytes(CERT_FILE);
            var caContents = File.ReadAllBytes(CA_FILE);

            var pem = string.Join("\n", certContents, caContents);

            HttpClientHandler handler = new HttpClientHandler();
            handler.ClientCertificates.Add(new X509Certificate());

            HttpClient client = new HttpClient(handler);

            var baseAddress = $"https://{CONTROL_SERVICE}:{CONTROL_PORT}";
            client.BaseAddress = new Uri(baseAddress);


        }

        private static void FileExistsOrDie(string fileName, string variableName)
        {
            if (!File.Exists(fileName))
            {
                throw new ArgumentNullException(variableName, $"Please set the {variableName} environment variable to a file that exists");
            }
        }
    }
}
