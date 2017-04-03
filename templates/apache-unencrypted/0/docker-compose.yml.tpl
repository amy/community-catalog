version: '2'
services:
  apache:
    image: php:7.1.3-apache
    volumes:
      - content:/var/www/html/
  apache-lb:
    image: rancher/lb-service-haproxy:v0.6.4
    ports:
      - ${PUBLISH_PORT}:80

volumes: 
  content:
    driver: ${VOLUME_DRIVER}
