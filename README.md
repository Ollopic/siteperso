## Docker

Pour installer le site en local, il faut rentrer les commandes :

```
docker build --tag=siteperso .

docker run --detach --publish 8000:80 --name=siteperso siteperso
```

Le site est alors accessible à l'adresse http://localhost:8000