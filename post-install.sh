# Author: Nicholas Kolatsis
# URL: https://github.com/nkolatsis/postinstall-scripts/ubuntu-docker-swarm.sh
#
###############
# Description #
###############
# A post-install script for Ubuntu 18.04 (LTS) install that is hosted on
# linode.com. The script will: TODO
#
################
# Instructions # 
################
# 1. Check to ensure that you have an ssh-key pair, otherwise generate one. NEVER do this step if you already have generated an ssh-key pair before today.
# 2. Edit the ./config/user-config.sh file
# 3. Run this file (./post-install.sh) on your desktop for server post-installation setup
# 4. On your first server, find and run ./swarm-manager.sh to setup the swarm manager
# 5. Repeat step 2 and 3 for every follow server then find and run ./swarm-node.sh to setup the swarm node




# TODO: The script that does it all
source ./config/user-config.sh

# Post install setup
scp post-install-start.sh root@$ssh_ip    # consider zipping all files and copying over the bundle at once if no possibility of a batch copy
ssh root@$ssh_ip
./post-install/post-install-setup-start.sh
ssh-copy-id $limited_user@$ssh_ip
ssh $limited_user@$ssh_ip
./post-install/post-install-setup-end.sh