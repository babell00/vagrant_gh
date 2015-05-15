#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

echo "Updataing repo"
apt-get update

echo "Installing git"
apt-get install git -y

echo "Cloning git reop"
git clone https://github.com/babell00/vagrant_gh.git

echo "Installing MC"
apt-get install mc -y

echo "Installing nginx"
apt-get install nginx -y

echo "Replacing configuration file"
mv /home/vagrant/vagrant_gh/load-b/nginx.conf /etc/nginx/nginx.conf

echo "Starting nginx service"
service nginx restart