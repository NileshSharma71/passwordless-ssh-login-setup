#!/bin/bash
sudo sed -i '40s/.*/PermitRootLogin yes/' /etc/ssh/sshd_config
sudo sed -i '65s/.*/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd
if [ $? -ne 0 ]; then
    echo "Failed to restart ssh service."
    exit 1
fi
user=$(whoami)
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
