#!/bin/bash

KEY_PATH="devhostnieuw"
USERNAME="ubuntu"
HOSTNAME="week3vm"

cat <<EOF > inventory.ini
[ubuntu_vms]
$HOSTNAME ansible_host=${IP} ansible_user=${USERNAME} ansible_ssh_private_key_file=./${KEY_PATH}
EOF

