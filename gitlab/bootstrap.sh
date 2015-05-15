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

echo "Installing gitlab"
apt-get install openssh-server ca-certificates -y
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | bash
apt-get install gitlab-ce -y
gitlab-ctl reconfigure





