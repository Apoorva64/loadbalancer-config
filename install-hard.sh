#!/usr/bin/env bash

# Install the required packages
sudo apt-get update
# Install ufw
sudo apt-get install ufw -y
# allow ssh, http, https
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
# enable ufw
sudo ufw enable

# Install the required haproxy
sudo apt-get install -y haproxy

# Copy the haproxy configuration file
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg

# Restart the haproxy service
sudo systemctl restart haproxy
