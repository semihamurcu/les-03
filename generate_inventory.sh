#!/bin/bash

read -p "Voer het IP-adres van de VM in: " IP
KEY_PATH="Week3_key"
USERNAME="ubuntu"

cat <<EOF > inventory.ini
[ubuntu_vms]
vmtest ansible_host=${IP} ansible_user=${USERNAME} ansible_ssh_private_key_file=./${KEY_PATH}
EOF

