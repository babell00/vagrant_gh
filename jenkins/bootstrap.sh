#!/usr/bin/env bash
set -e

if [ "$EUID" -ne "0" ] ; then
        echo "Script must be run as root." >&2
        exit 1
fi

echo "Installing maven"
apt-get install maven -y

echo "Installing git"
apt-get install git -y

echo "Cloning git reop"
git clone https://github.com/babell00/vagrant_gh.git

echo "Installing mc"
apt-get install mc -y


#echo "Installing gitlab"
#apt-get install openssh-server ca-certificates postfix -y
#curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
#apt-get install gitlab-ce -y

echo "Installing Jenkins"
wget -q -O - https://jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update
apt-get install jenkins -y

#echo "Installing git plugin for jenkins"
#su - jenkins
#mkdir .ssh


echo "Starting Jenkins"
service jenkins restart

echo "Installing nginx"
apt-get install nginx -y

echo "Replacing configuration file"
mv /home/vagrant/vagrant_gh/jenkins/nginx.conf /etc/nginx/nginx.conf

echo "Starting nginx service"
service nginx restart




