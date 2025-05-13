resource "esxi_guest" "Opdracht3VM" {
  guest_name     = "Opdracht3VM"
  disk_store     = "Datastore1"
  ovf_source     = "https://cloud-images.ubuntu.com/releases/24.04/release/ubuntu-24.04-server-cloudimg-amd64.ova"

  numvcpus       = 1
  memsize        = 1024

  network_interfaces {
    virtual_network = "VM Network"
  }

  ovf_properties = {
    "user-data" = base64encode(file("${path.module}/user-data"))
    "meta-data" = base64encode(file("${path.module}/meta-data"))
  }
}

resource "local_file" "inventory" {
  filename = "${path.module}/inventory.ini"
  content  = <<EOT
[Opdracht3VM]
${esxi_guest.Opdracht3VM.ip_address} ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/iac_key
EOT
}
