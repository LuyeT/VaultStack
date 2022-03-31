packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "centos-Apache" {
  ami_name      = "centos8-Apache {{ timestamp }}"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami_filter {
    filters = {
      image-id            = "ami-073a8e22592a4a925"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["125523088429"]
  }
  ssh_username = "centos"
}

build {
  name = "centos-Apache"
  sources = [
    "source.amazon-ebs.centos-Apache"
  ]
  provisioner "shell" {
    script = "./configuration.sh"
  }
}
