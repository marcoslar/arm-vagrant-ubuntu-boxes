packer {
  required_plugins {
    vmware = {
      version = ">= 1.0.5"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

source "vmware-iso" "ubuntu-2104-arm64" {
  iso_url = "https://cdimage.ubuntu.com/releases/21.04/release/ubuntu-21.04-live-server-arm64.iso"
  iso_checksum = "6b60e12a344212855c9658acfe8593f37cd066ea7f2d32f0254a8478cd23c2e5"
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_timeout = "30m"
  shutdown_command = "sudo shutdown -h now"
  guest_os_type = "arm-ubuntu-64"
  disk_adapter_type = "nvme"
  version = 19
  http_directory = "http"
  boot_wait = "10s"
  boot_command = [
    "c",
    "linux /casper/vmlinuz \"ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\" --- autoinstall",
    "<enter>",
    "initrd /casper/initrd",
    "<enter>",
    "boot",
    "<enter><wait>"
  ]
  usb = true
  memory = 1024
  cpus = 2
  disk_size = 40000
  vm_name = "ubuntu-21.04-arm64"
  output_directory = "output"
}

build {
  sources = ["sources.vmware-iso.ubuntu-2104-arm64"]

  provisioner "shell" {
    scripts = [
      "scripts/add-key.sh",
      "scripts/cleanup.sh"
    ]
  }
}
