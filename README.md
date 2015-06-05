# flocker-api-examples

A repository demonstrating how to use the Flocker REST API using various languages.

Each example expects there to be a running Flocker cluster with TLS authentciation setup.

## installation

First make sure you have a running Flocker cluster setup - you can read how to do this [here](https://docs.clusterhq.com)

Then, clone this repo:

```bash
$ git clone https://github.com/binocarlos/flocker-api-examples
$ cd flocker-api-examples
```

## configuration

You will need to change the following values (either by editing the source files or by setting
environment variables):

 * CONTROL_SERVICE - the IP address of the Flocker control service
 * CONTROL_PORT - the port the control service is listening on
 * KEY_FILE - the API key file to use
 * CERT_FILE - the API certificate file to use
 * CA_FILE - the certificate authority file to use

## python

```bash
$ python example.py
```

NOTE: you will need at least python 2.7.9 to run the example

## curl

```bash
$ bash example.sh
```

NOTE: if you are on OSX - you will need a version of curl that supports OpenSSL:

```bash
$ brew install curl --with-openssl
$ brew link --force curl
$ hash -r
$ curl --version
curl 7.42.1 (x86_64-apple-darwin14.1.0) libcurl/7.42.1 OpenSSL/1.0.2a zlib/1.2.5
```

## golang

```bash
$ go build example.go
$ ./example
```
