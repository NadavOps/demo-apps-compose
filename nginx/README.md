# Nginx (compose 2.3)

## Build, Push, Delete
```bash
docker build -t nadavops/nginx:delme_tests .
docker push nadavops/nginx:delme_tests
docker build -t nadavops/nginx:delme_tests . && docker push nadavops/nginx:delme_tests && docker image rm -f nadavops/nginx:delme_tests
```

## Run
```bash
docker-compose up -d
```

## Remove
```bash
docker-compose down
```
