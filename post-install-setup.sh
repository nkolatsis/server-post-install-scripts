source config.sh

# Set hostname


# Set the timezone
ln -fs /usr/share/zoneinfo/$timezone /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

# Setup unattended upgrades #
#############################

sudo apt install unattended-upgrades

# crude solution - should be improved
echo "
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
//      "${distro_id}:${distro_codename}-updates";
//      "${distro_id}:${distro_codename}-proposed";
//      "${distro_id}:${distro_codename}-backports";
};
" > /etc/apt/apt.conf.d/50unattended-upgrades

# blacklisted packages from the unattended upgrades
echo "
Unattended-Upgrade::Package-Blacklist {
//      "vim";
//      "libc6";
//      "libc6-dev";
//      "libc6-i686";
};
" >> /etc/apt/apt.conf.d/50unattended-upgrades

# Probably not necessary and should be removed
echo "Unattended-Upgrade::DevRelease \"false\";
" >> /etc/apt/apt.conf.d/50unattended-upgrades

echo "
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "7";
APT::Periodic::Unattended-Upgrade "1";
" > /etc/apt/apt.conf.d/20auto-upgrades

# Add a limited User Account
adduser $limited_user
adduser $limited_user sudo
$limited_user ALL=NOPASSWD: ALL >> /etc/sudoers # consider removing
sudo update-alternatives --set editor /usr/bin/vim.basic

exit # and setup ssh access only