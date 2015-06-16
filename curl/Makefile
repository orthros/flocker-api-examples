build:
	@docker build -t clusterhq/flocker-api-examples:curl .

test:
	@docker run --rm -ti \
		-v /vagrant:/keys \
		-e CONTROL_SERVICE=172.16.255.250 \
		-e KEY_FILE=/keys/user.key \
		-e CERT_FILE=/keys/user.crt \
		-e CA_FILE=/keys/cluster.crt \
		clusterhq/flocker-api-examples:curl

.PHONY: test build