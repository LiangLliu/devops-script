#!/bin/bash -e
cd $(dirname $0)

docker-compose -f ./elastic-docker-tls.yml down -v
docker-compose -f ./create-certs.yml down -v

docker-compose -f ./create-certs.yml run --rm create_certs
docker-compose -f ./elastic-docker-tls.yml up -d

docker-compose -f ./elastic-docker-tls.yml exec es01 /bin/bash -c "bin/elasticsearch-setup-passwords auto --batch --url https://es01:9200" > pass.txt

./update-env.sh
docker-compose -f ./elastic-docker-tls.yml up -d