package main

import (
    "crypto/tls"
    "crypto/x509"
    "os"
    "log"
    "fmt"
    "io/ioutil"
    "net/http"
)

// a map of string->string that holds our configuration
// the configuration can be overriden by env vars
var envMap = map[string]string{
    "CONTROL_SERVICE": "54.157.8.57",
    "CONTROL_PORT": "4523",
    "KEY_FILE":"/Users/kai/projects/flocker-api-examples/flockerdemo.key",
    "CERT_FILE":"/Users/kai/projects/flocker-api-examples/flockerdemo.crt",
    "CA_FILE":"/Users/kai/projects/flocker-api-examples/cluster.crt",
}

// use the config map to create a TLS client
func getTLSClient(config map[string]string) (http.Client) {
    // Load client cert
    cert, err := tls.LoadX509KeyPair(config["CERT_FILE"], config["KEY_FILE"])
    if err != nil {
        log.Fatal(err)
    }

    // Load CA cert
    caCert, err := ioutil.ReadFile(config["CA_FILE"])
    if err != nil {
        log.Fatal(err)
    }
    caCertPool := x509.NewCertPool()
    caCertPool.AppendCertsFromPEM(caCert)

    // Setup HTTPS client
    tlsConfig := &tls.Config{
        Certificates: []tls.Certificate{cert},
        RootCAs:      caCertPool,
    }
    tlsConfig.BuildNameToCertificate()
    transport := &http.Transport{TLSClientConfig: tlsConfig}
    client := &http.Client{Transport: transport}
    return *client
}

// use the config to generate a full URL
func getUrl(config map[string]string, path string) (string) {
    url := fmt.Sprint("https://", config["CONTROL_SERVICE"], ":", config["CONTROL_PORT"], path)
    return url
}

func main() {
    
    config := map[string]string{}

    for key, value := range envMap {
        envValue := os.Getenv(key)
        if envValue != "" {
            config[key] = envValue
        } else {
            config[key] = value
        }
    }

    client := getTLSClient(config)
    
    // Do GET something
    resp, err := client.Get(getUrl(config, "/v1/version"))
    if err != nil {
        log.Fatal(err)
    }
    defer resp.Body.Close()

    // Dump response
    data, err := ioutil.ReadAll(resp.Body)
    if err != nil {
        log.Fatal(err)
    }
    fmt.Println(string(data))
}