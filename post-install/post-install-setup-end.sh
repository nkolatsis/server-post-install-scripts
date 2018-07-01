source ../config/user-config.sh
source ../config/script-config.sh


# disable root logins
sudo sed -i -e 's/PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config
sudo sed -i -e 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config

# IPv4 only
sudo sed -i -e 's/#AddressFamily any/AddressFamily inet/g' /etc/ssh/sshd_config

# Restart to load the new config
sudo systemctl restart sshd

# TODO: Setup Fail2Ban & other measures: https://linode.com/docs/security/securing-your-server/