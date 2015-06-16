build:
	@docker build -t clusterhq/flocker-api-examples:curl .

test:
	@docker run --rm \
		-e CONTROL_SERVICE=172.16.255.250 \
		-e KEY_FILE= \
		-e CERT_FILE= \
		-e CA_FILE= \
		clusterhq/flocker-api-examples:curl

.PHONY: test build