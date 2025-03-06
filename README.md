_DOCKER AND POSTGRES ARE REQUIRED TO RUN THIS_

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

https://www.docker.com/products/docker-desktop/

<h2>Instructions (Temporary until build script is created)</h2>

While in the project directory run

```
docker-compose up -d
```

To stop the container AND clear all data run
docker exec -it test_db psql -U admin -d test_db

```
docker-compose down -v
```

To ssh into the container run

```
docker exec -it test_db psql -U admin -d test_db
```
