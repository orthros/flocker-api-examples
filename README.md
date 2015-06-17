# flocker-api-examples

A repository demonstrating how to use the Flocker REST API using various languages.

Each example expects there to be a running Flocker cluster with TLS authentication setup.

## installation

First make sure you have a running Flocker cluster setup - you can read how to do this [here](https://docs.clusterhq.com)

Then, clone this repo:

```bash
$ git clone https://github.com/binocarlos/flocker-api-examples
$ cd flocker-api-examples
```

## configuration

For each of the examples - you can change the following values (either by editing the source files or by setting
environment variables):

 * CONTROL_SERVICE - the IP address of the Flocker control service
 * CONTROL_PORT - the port the control service is listening on
 * KEY_FILE - the API key file to use
 * CERT_FILE - the API certificate file to use
 * CA_FILE - the certificate authority file to use

## tests

To run the tests:

```bash
$ vagrant up
$ bash runtests.sh
$ vagrant destroy -f
```

This will use the included Vagrantfile to spin up a 2 node Flocker cluster.

It will then test the output of the examples against an expected output.

