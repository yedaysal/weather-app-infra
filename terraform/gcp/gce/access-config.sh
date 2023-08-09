#!/bin/sh

# Description: This script adds the host entry of
# the created GCE instance to
# the /etc/hosts file and adds the necessary SSH
# client config to the /etc/ssh/ssh_config file.
# Author: Yunus Emre Daysal

echo "Removing previous devops-server host entry from current user's known_hosts file..."
sed -i '' '/devops-server/d' $(echo $HOME)/.ssh/known_hosts

echo "Deleting empty lines from /etc/hosts..."
sed -i '' '/^[[:space:]]*$/d' /etc/hosts

echo "Removing previous devops-server host entry from /etc/hosts..."
sed -i '' '/devops-server/d' /etc/hosts

echo "\n# Host entry for devops-server" >> /etc/hosts

echo "Adding devops-server's host entry to /etc/hosts..."
echo "$(terraform output devops-server_public_ip | tr -d '"') devops-server" >> /etc/hosts

echo "Verifying the host entry has been added..."
grep "devops-server" /etc/hosts

echo "Deleting previous devops-server SSH config entries..."
sed -i '' '/ansible/d;/devops-server/d' /etc/ssh/ssh_config

echo "Adding SSH client config for devops-server..."
cat >> /etc/ssh/ssh_config <<- EOM
Host devops-server
  User ansible
EOM