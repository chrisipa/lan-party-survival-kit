#!/bin/bash

# create folders
sudo mkdir -p /opt/lets-chat/config
sudo mkdir -p /opt/lpsk
sudo mkdir -p /opt/teamspeak

# change permissions for teamspeak folder
sudo chown -R 503.503 /opt/teamspeak

# move config files to folders
sudo mv /tmp/settings.yml /opt/lets-chat/config
sudo mv /tmp/docker-compose.yml /opt/lpsk
sudo mv /tmp/lpsk /etc/init.d/lpsk

# make init script executable
sudo chmod +x /etc/init.d/lpsk

# register init script
sudo update-rc.d lpsk defaults

# download and start containers
sudo service lpsk update