# Elasticsearch, Kibana
# Activation Manual
* make sure `ES_JAVA_OPTS=-Xms1g -Xmx1g` is ok with you

* Create/ destroy env with default values
```
docker-compose up -d
docker-compose down
```

* Create/ destroy env with custom values
```
COMPOSE_PROJECT_NAME=2 ELASTICSEARCH_EXPOSED_PORT=9202 KIBANA_EXPOSED_PORT=5602 ELASTIC_VERSION=8.5.1 docker-compose up -d
COMPOSE_PROJECT_NAME=2 docker-compose down
```

# Some unimportant comments
* some exmaples https://gist.github.com/markheath/f246ec3aa5a3e7493991904e241a416a
                https://blog.devgenius.io/elasticsearch-and-kibana-installation-using-docker-compose-886c4823495e
* Simple configuration, no config specs
* When tried to run on bridge default network it failed as DNS doesnt work there :O (so we create a dedicated network- compose default)