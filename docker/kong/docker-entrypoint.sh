#!/bin/sh

# Adopted from: https://github.com/Kong/docker-kong/blob/9bbc9e8b4a61cba5cc4e4e4562a802dace4348ff/centos/docker-entrypoint.sh

set -e

export KONG_NGINX_DAEMON=off

if [[ "$1" == "kong" ]]; then
  PREFIX=${KONG_PREFIX:=/usr/local/kong}
  mkdir -p $PREFIX

  if [[ "$2" == "docker-start" ]]; then
    kong prepare -p $PREFIX

    exec /usr/local/openresty/nginx/sbin/nginx \
      -p $PREFIX \
      -c nginx.conf
  fi
fi

exec "$@"