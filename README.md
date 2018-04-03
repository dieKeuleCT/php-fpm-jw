# php-fpm-jw

PHP-FPM-Alpine Fork (most recent 5.6) with modules needed for joomla and wordpress

## active PHP modules
* xml
* xmlrpc
* bcmath
* bz2
* ctype
* curl
* gd
* gettext
* hash
* iconv
* json
* mbstring
* mysqli
* opcache
* pcntl
* pdo
* pdo_mysql
* phar
* posix
* zip

## usage
Example usage with docker-compose and nginx:latest

docker-compose.yml

---
  web:
    image: nginx:latest
    volumes:
        - ./data/html:/usr/share/nginx/html/
        - ./conf/site.conf:/etc/nginx/conf.d/default.conf
        - ./data/logs:/var/log
    links:
        - php
    networks:
      - frontend
      - default
  php:
    image: diekeulect/php-fpm-jw:latest
    volumes:
        - ./data/html:/usr/share/nginx/html/
---

If you need access to a DB (eg Mysql or Maria) you need to add the links to the php container

