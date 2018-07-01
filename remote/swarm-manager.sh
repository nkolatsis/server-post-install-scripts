source ./config/user-config.sh

# Download and install docker
curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker $limited_user

# Initialise Docker Swarm manager and capture swarm join command
swarm_join=$(sudo docker swarm init --advertise-addr $ssh_ip | grep -E "docker swarm join --token .* [\d\.\:]*")
