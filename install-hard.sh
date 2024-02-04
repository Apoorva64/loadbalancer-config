#!/usr/bin/env bash

# Install the required packages
sudo apt-get update
# Install the required haproxy
sudo apt-get install -y haproxy

# Copy the haproxy configuration file
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg

# Restart the haproxy service
sudo systemctl restart haproxy
