# Author: Nicholas Kolatsis
# URL: https://github.com/nkolatsis/postinstall-scripts/ubuntu-docker-swarm.sh
#
# Instructions:
# Respond to password prompts and other stuff
# 
# Description:
# A post-install script for Ubuntu 18.04 (LTS) install that is hosted on
# linode.com. The script will:
#   - add a user with sudo access
#   - change the hostname and hosts file
#   - install docker
#   - configure the server as a docker swarm manager or node as required




# TODO: The script that does it all
source config.sh

# Post install setup
scp post-install-setup.sh root@$ssh_ip    # consider zipping all files and copying over the bundle at once if no possibility of a batch copy
scp swarm-manager-setup.sh root@$ssh_ip
ssh root@$ssh_ip
./post-install-setup.sh

# Make sure you have already setup your ssh keys with 'ssh-keygen -b 4096'. Never do this more than once.
ssh-copy-id $limited_user@$ssh_ip
ssh $limited_user@$ssh_ip

# disable root logins
sudo sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# IPv4 only
sudo sed -i -e 's/#AddressFamily any/AddressFamily inet/g' /etc/ssh/sshd_config

# Restart to load the new config
sudo systemctl restart sshd

# TODO: Setup Fail2Ban & other measures: https://linode.com/docs/security/securing-your-server/

#

./swarm-manager.sh
