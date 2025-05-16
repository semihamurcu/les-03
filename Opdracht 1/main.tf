resource "esxi_guest" "week3vm" {
  guest_name         = "week3vm"
  disk_store         = "Datastore1"
  ovf_source         = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"
  
  network_interfaces {
    virtual_network = "VM Network"
  }

  guestinfo = {
    "metadata"          = filebase64("metadata.yaml")
    "metadata.encoding" = "base64"
    "userdata"          = filebase64("userdata.yaml")
    "userdata.encoding" = "base64"
  }
}

output "vm_ip_address" {
  value = esxi_guest.week3vm.ip_address
}

resource "local_file" "ansible_inventory" {
  content = <<EOF
[week3vm]
${esxi_guest.week3vm.guest_name} ansible_host=${esxi_guest.week3vm.ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/devhostnieuw
EOF

  filename = "${path.module}/inventory.ini"
}

