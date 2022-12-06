#!/bin/bash -e
cd $(dirname $0)

docker-compose -f ./elastic-docker-tls.yml exec es01 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.17.7/elasticsearch-analysis-ik-7.17.7.zip
docker-compose -f ./elastic-docker-tls.yml restart es01

docker-compose -f ./elastic-docker-tls.yml exec es02 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.17.7/elasticsearch-analysis-ik-7.17.7.zip
docker-compose -f ./elastic-docker-tls.yml restart es02

docker-compose -f ./elastic-docker-tls.yml exec es03 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.17.7/elasticsearch-analysis-ik-7.17.7.zip
docker-compose -f ./elastic-docker-tls.yml restart es03
