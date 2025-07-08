#!/bin/bash
read -p "Enter the IP address of the VM for passwordless SSH (as root): " ipa
read -p "Enter username to connect (default = root): " user
user=${user:-root}
mkdir -p ~/.ssh/ssh-new
if [ $? -ne 0 ]; then
    echo "failed to create ssh-new folder."
    exit 1
fi
ssh-keygen -t rsa -f ~/.ssh/ssh-new/ssh-new-id -N "" -q
if [ $? -eq 0 ]; then
    echo "successfully created a new ssh key in ssh-new directory."
else
    echo "failed to generate ssh key."
    exit 1
fi
ssh-copy-id -i ~/.ssh/ssh-new/ssh-new-id.pub $user@$ipa
if [ $? -ne 0 ]; then
    echo "failed to copy key into $user@$ipa."
    exit 1
else
    echo "ssh key successfully copied to $user@$ipa."
    echo "now try to connect to $user@$ipa"
fi
