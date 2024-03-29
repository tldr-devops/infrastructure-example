module "ubuntu_ami" {
  source = "../../../../../../../modules/aws/ec2/ami"
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
resource "aws_instance" "dev_example" {
  ami                         = module.ubuntu_ami.id
  instance_type               = "t3.nano"
  key_name                    = var.terraform_key_pair_id
  vpc_security_group_ids      = var.vpc_security_group_ids
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "dev_example"
  }

  root_block_device {
    volume_size = 15
  }

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      "associate_public_ip_address",
      "instance_state"
    ]
  }

  /* provisioner "local-exec" {
    command = <<-EOT
      echo '${var.terraform_key_pair_private_key_openssh}' > ssh-key
      chmod 600 ssh-key
    EOT
    working_dir = path.module
  } */

  provisioner "file" {
    source      = "../../../../../../../../ansible"
    destination = "/home/ubuntu"

    # https://www.terraform.io/language/resources/provisioners/connection
    connection {
        type     = "ssh"
        user     = "ubuntu"
        private_key = "${var.terraform_key_pair_private_key_openssh}"
        host     = "${self.public_ip}"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "cd /home/ubuntu/ansible",
      "sudo apt update",
      "sudo env DEBIAN_FRONTEND=noninteractive apt install -y ansible",
      "ansible-playbook playbooks/users.yml"
    ]

    # https://www.terraform.io/language/resources/provisioners/connection
    connection {
        type     = "ssh"
        user     = "ubuntu"
        private_key = "${var.terraform_key_pair_private_key_openssh}"
        host     = "${self.public_ip}"
    }
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
resource "aws_eip" "dev_example_eip" {
  vpc = true
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association
resource "aws_eip_association" "dev_example_eip_association" {
  instance_id   = aws_instance.dev_example.id
  allocation_id = aws_eip.dev_example_eip.id
}
