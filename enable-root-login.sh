#!/bin/bash
sudo sed -i 's@^[#[:space:]]*PermitRootLogin.*@PermitRootLogin yes@' /etc/ssh/sshd_config
sudo sed -i 's@^[#[:space:]]*PasswordAuthentication.*@PasswordAuthentication yes@' /etc/ssh/sshd_config
sudo sed -i 's@^[#[:space:]]*PasswordAuthentication.*@PasswordAuthentication yes@' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart ssh
if [ $? -ne 0 ]; then
    echo "Failed to restart ssh service."
    exit 1
fi
user=$(whoami)
sudo passwd -u root #if the root account disabled by default in ubuntu machine
echo "root:hello2323" | sudo chpasswd
if [ $? -eq 0 ]; then
    echo "password changed for root user."
else
    echo "failed to change password for root."
    exit 1
fi
echo "$user:hello2323" | sudo chpasswd
if [ $? -eq 0 ]; then
    echo "password changed for $user user."
else
    echo "failed to change password for $user."
    exit 1
fi
