#!/usr/bin/env bash
# Install ufw
sudo apt-get install ufw -y
# allow ssh, http, https
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
# enable ufw
sudo ufw enable
