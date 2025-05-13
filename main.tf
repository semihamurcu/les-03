resource "esxi_guest" "Week3VM" {
  guest_name     = "Week3VM"
  disk_store     = "Datastore1"
  ovf_source     = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"

  numvcpus       = 1
  memsize        = 1024

  network_interfaces {
    virtual_network = "VM Network"
  }
}

resource "local_file" "inventory" {
  filename = "${path.module}/inventory.ini"
  content  = <<EOT
[Week3VM]
${esxi_guest.Week3VM.ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/Week3_key
EOT
}
