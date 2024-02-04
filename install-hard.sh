#!/usr/bin/env bash


# Install the required packages
sudo apt-get update

# Install the required haproxy
sudo apt-get install -y haproxy

# build config
./config-builder/build-config.sh $@

# Copy the haproxy configuration file
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg

# Restart the haproxy service
sudo systemctl restart haproxy

# ufw
./install-ufw.sh
