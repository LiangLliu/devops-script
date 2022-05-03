### 安装ik分词插件：

* 集群安装

```shell
# 集群安装
docker-compose exec es01 elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.15.2/elasticsearch-analysis-ik-7.15.2.zip

# 然后要重启es容器
docker-compose restart es01
```

* 单节点安装
```shell
docker run --name elasticsearch -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e ES_JAVA_OPTS="-Xms512m -Xmx512m" -d elasticsearch:7.15.2

# 进入容器es
docker exec -it es /bin/bash
# 使用bin目录下的elasticsearch-plugin install安装ik插件
bin/elasticsearch-plugin install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.15.2/elasticsearch-analysis-ik-7.15.2.zip
# 再重启下容器
docker restart es
```
