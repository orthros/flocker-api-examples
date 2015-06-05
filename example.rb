require "net/https"
require "uri"

# NOTE - to run this example, you need at least python 2.7.9

# Define the control IP, port, and the certificates for authentication.

CONTROL_SERVICE = ENV['CONTROL_SERVICE'] || '54.157.8.57'
CONTROL_PORT = ENV['CONTROL_PORT'] || 4523
KEY_FILE = ENV['KEY_FILE'] || '/Users/kai/projects/flocker-api-examples/flockerdemo.key'
CERT_FILE = ENV['CERT_FILE'] || '/Users/kai/projects/flocker-api-examples/flockerdemo.crt'
CA_FILE = ENV['CA_FILE'] || '/Users/kai/projects/flocker-api-examples/cluster.crt'

def getTLSClient()
    key_contents = File.read(KEY_FILE)
    cert_contents = File.read(CERT_FILE)
    ca_contents = File.read(CA_FILE)
    pem = cert_contents + "\n" + ca_contents
    http = Net::HTTP.new(CONTROL_SERVICE, CONTROL_PORT)
    http.use_ssl = true
    
    http.verify_mode = OpenSSL::SSL::VERIFY_PEER
    http.cert = OpenSSL::X509::Certificate.new(pem)
    http.key = OpenSSL::PKey::RSA.new(key_contents)
    return http
end

def getURL()

end

client = getTLSClient()

client.get2('/v1/version'){
    |resp|
    print resp.body
}