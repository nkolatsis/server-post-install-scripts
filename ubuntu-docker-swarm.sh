# Author: Nicholas Kolatsis
# URL: https://github.com/nkolatsis/postinstall-scripts/ubuntu-docker-swarm.sh
# 
# Description:
# A post-install script for Ubuntu 18.04 (LTS) install that is hosted on
# linode.com. The script will:
#   - add a user with sudo access
#   - change the hostname and hosts file
#   - install docker
#   - configure the server as a docker swarm manager or node as required


# Configure me here
user="nkolatsis"
swarm="" # options: ["manager", "node"]
auth_type="ssh-keys" # options: ["ssh-keys", "password"]
hostname=""
ssh_ip=""


# Swarm manager configuration

# TODO: The script that does it all