FROM ubuntu:latest
LABEL org.opencontainers.image.authors="Marechal Antoine"

# Installation de Apache
RUN apt-get -yqq update && apt-get install -yqq apache2 apache2-utils

# Installation de Caddy
RUN apt-get -yqq update && apt-get install -yqq curl
RUN curl https://getcaddy.com | bash -s personal

# Copie du fichier de configuration de Caddy
COPY Caddyfile /etc/Caddyfile

WORKDIR /var/www/html
COPY ./website/ /var/www/html/
COPY run.sh /
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

ENV HOME /var/www/html
RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR
# Execution de Caddy et d'Apache
# Lancement de Apache en arrière-plan
CMD /usr/sbin/apache2 -D FOREGROUND & \
    # Lancement de Caddy en tâche de fond
    caddy run --config /etc/Caddyfile & \
    # Attente infinie
    tail -f /dev/null
EXPOSE 80