FROM caddy:2-alpine

WORKDIR /var/www/html

COPY ./website /var/www/html
RUN chmod a+r /var/www/html

COPY Caddyfile /etc/caddy/Caddyfile
RUN chmod a+r /var/www/html/*