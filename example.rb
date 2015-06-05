require 'net/https'

# NOTE - to run this example, you need at least python 2.7.9

# Define the control IP, port, and the certificates for authentication.

CONTROL_SERVICE = ENV['CONTROL_SERVICE'] || '54.157.8.57'
CONTROL_PORT = ENV['CONTROL_PORT'] || 4523
KEY_FILE = ENV['KEY_FILE'] || '/Users/kai/projects/flocker-api-examples/flockerdemo.key'
CERT_FILE = ENV['CERT_FILE'] || '/Users/kai/projects/flocker-api-examples/flockerdemo.crt'
CA_FILE = ENV['CA_FILE'] || '/Users/kai/projects/flocker-api-examples/cluster.crt'

STDOUT.write CONTROL_SERVICE