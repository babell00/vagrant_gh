#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi


echo "Installing mc"
apt-get install mc -y

echo "Installing Tomcat 7"
apt-get install  tomcat7 -y