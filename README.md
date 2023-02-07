## Docker

Pour installer le site en local, il faut rentrer les commandes :

```
docker build --tag=siteperso .

docker run --detach --publish 8000:80 --name=siteperso siteperso
```

Le site est alors accessible à l'adresse http://localhost:8000


## Accessibilité extérieur

Pour que le site soit accessible depuis l'extérieur, Caddy gère cet aspect là. Il faut modifier le Caddyfile pour mettre le nom de domaine de notre choix. Par la suite il faut ouvir le port 8002.