#!/bin/bash -e
cd $(dirname $0)

docker-compose up -d
docker-compose exec es01 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.15.2/elasticsearch-analysis-ik-7.15.2.zip
docker-compose restart es01

mkdir -p ~/xxxx

docker cp xxxx-kibana-1:/usr/share/kibana/config/certs  ~/xxxx/certs

docker-compose down -v