#!/usr/bin/env bash

sed -i "s/Listen 80/Listen ${PORT:-80}/g" /etc/apache2/ports.conf
/usr/local/bin/docker-entrypoint.sh apache2-foreground