#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

echo "Updataing repo"
apt-get update

echo "Installing MC"
apt-get install mc -y

echo "Installing nginx"
apt-get install nginx -y

echo "Replacing configuration file"
rm -f /etc/nginx/nginx.conf
cp nginx.conf /etc/nginx/

echo "Starting nginx service"
service nginx start