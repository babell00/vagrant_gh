#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

echo "Installing git"
apt-get install git -y

echo "Cloning git reop"
git clone https://github.com/babell00/vagrant_gh.git

echo "Installing mc"
apt-get install mc -y

echo "Installing Tomcat 7"
apt-get install  tomcat7 -y

echo "Replacing index file in tomcat"
mv /home/vagrant/vagrant_gh/tomcat1/tomcat/index.html /var/lib/tomcat7/webapps/ROOT/index.html
