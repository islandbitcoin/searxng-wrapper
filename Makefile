ID_NAME := $(shell yq e ".id" manifest.yaml)
VERSION := $(shell yq e ".version" manifest.yaml)
TS_FILES := $(shell find ./ -name \*.ts)

# delete the target of a rule if it has changed and its recipe exits with a nonzero exit status
.DELETE_ON_ERROR:

all: verify

install: all
	embassy-cli package install $(ID_NAME).s9pk

verify: $(ID_NAME).s9pk
	embassy-sdk verify s9pk $(ID_NAME).s9pk

clean:
	rm -f image.tar
	rm -f $(ID_NAME).s9pk
	rm -f scripts/*.js

$(ID_NAME).s9pk: manifest.yaml instructions.md scripts/*.sh icon.svg LICENSE scripts/embassy.js image.tar
	embassy-sdk pack

image.tar: Dockerfile docker_entrypoint.sh scripts/*.sh 
	DOCKER_CLI_EXPERIMENTAL=enabled docker buildx build --tag start9/$(ID_NAME)/main:$(VERSION) --platform=linux/arm64/v8 -o type=docker,dest=image.tar -f ./Dockerfile .

scripts/embassy.js: $(TS_FILES)
	deno bundle scripts/embassy.ts scripts/embassy.js
