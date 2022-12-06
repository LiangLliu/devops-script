#!/bin/bash -e
cd $(dirname $0)

KIBANA_SYSTEM=$(cat ./pass.txt | grep 'kibana_system = ' | awk -F 'kibana_system = ' '{print $2}')
ELASTIC=$(cat ./pass.txt | grep 'elastic = ' | awk -F 'elastic = ' '{print $2}')

sed -i "s/ELASTIC_PASSWORD=.*$/ELASTIC_PASSWORD=$ELASTIC/g" ./.env
sed -i "s/KIBANA_PASSWORD=.*$/KIBANA_PASSWORD=$KIBANA_SYSTEM/g" ./.env
