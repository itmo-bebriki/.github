#!/bin/bash

# Clone repositories to store proto contracts locally.
# That is needed for kafka-ui.

if [[ ! -d "task-service" ]]; then
	git clone git@github.com:itmo-bebriki/task-service.git
fi

if [[ ! -d "board-service" ]]; then
	git clone git@github.com:itmo-bebriki/board-service.git
fi

if [[ ! -d "analytics-service" ]]; then
	git clone git@github.com:itmo-bebriki/analytics-service.git
fi

if [[ ! -d "agreement-service" ]]; then
	git clone git@github.com:itmo-bebriki/agreement-service.git
fi

docker-compose up -d

# Sleep 5 seconds and then restart all services.
# That is an obligatory operation, because without that
# services are bugged (they cannot load schema or something like this).
# A simple restart heals this behaviour.
sleep 5s

docker restart task-service
docker restart board-service
docker restart analytics-service
docker restart agreement-service
