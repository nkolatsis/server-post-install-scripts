# Author: Nicholas Kolatsis
# URL: https://github.com/nkolatsis/postinstall-scripts/ubuntu-docker-swarm.sh

###############
# Description #
###############
# A script for fresh Ubuntu 18.04 (LTS) installs hosted on linode.com. This script handles post-install configuration and sets up a docker swarm.

################
# Instructions # 
################
# 1. Check to ensure that you have an ssh-key pair, otherwise generate one. NEVER do this step if you already have generated an ssh-key pair before today.
# 2. Create a fresh Ubuntu 18.04 server through the linode website
# 3. Edit the ./remote/config/user-config.sh file appropriately. Don't touch script-config.sh.
# 3. Run this file (./post-install.sh) on your desktop for server post-installation setup. Respond to prompts.
# 4. On your first server, find and run /home/remote/swarm-manager.sh to setup the swarm manager. Respond to prompts.
# 5. Repeat step 2 and 3 for every follow server then find and run /home/remote/swarm-node.sh to setup the swarm node. Respond to prompts.
# 6. Delete all uploaded files once setup is complete.

# ssh-keygen -f "/home/nkolatsis/.ssh/known_hosts" -R 172.104.158.191


source ./remote/config/user-config.sh

scp -r ./remote root@$ssh_ip:/home

aaa=/home/remote/post-install/post-install-setup-start.sh
ssh root@$ssh_ip "chmod +x $aaa && $aaa"
ssh-copy-id $limited_user@$ssh_ip
ssh $limited_user@$ssh_ip
ccc=/home/remote/post-install/post-install-setup-end.sh
chmod +x $ccc && $ccc