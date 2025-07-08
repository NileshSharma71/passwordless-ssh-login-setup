#!/bin/bash
set -e
sudo sed -i 's@^[#[:space:]]*PermitRootLogin.*@PermitRootLogin prohibit-password@' /etc/ssh/sshd_config
sudo sed -i 's@^[#[:space:]]*PasswordAuthentication.*@PasswordAuthentication no@' /etc/ssh/sshd_config
sudo sed -i 's@^[#[:space:]]*PasswordAuthentication.*@PasswordAuthentication no@' /etc/ssh/sshd_config.d/60-cloudimg-settings.conf
sudo systemctl restart ssh
