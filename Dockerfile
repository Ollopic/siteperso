FROM caddy:2-alpine

WORKDIR /app

COPY ./website .

COPY ./Caddyfile /etc/caddy/Caddyfile