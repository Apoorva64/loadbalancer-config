#!/usr/bin/env bash

# Install the required packages
sudo apt-get update
sudo apt-get install curl -y

curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run