#!/bin/bash

USER="www-data"
if [ ! -z "$USER_ID" -a ! -z "$GROUP_ID" ] ; then
   echo "Switching to user"
   USER="user"
   deluser "$USER"
   delgroup "$USER"
   addgroup --gid "$GROUP_ID" "$USER"
   adduser --disabled-password --disabled-login --no-create-home --system --uid "$USER_ID" --gid "$GROUP_ID" "$USER"
fi
sed -e "s/%%USER%%/$USER/" "/usr/local/etc/php-fpm.d/zz-docker.conf.tpl" > /usr/local/etc/php-fpm.d/zz-docker.conf

$*
