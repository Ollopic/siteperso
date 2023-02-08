FROM nginx:alpine

WORKDIR /app

COPY ./website .

COPY ./nginx.conf /etc/nginx/nginx.conf