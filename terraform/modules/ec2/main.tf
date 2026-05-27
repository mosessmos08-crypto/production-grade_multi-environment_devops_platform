terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.46.0"
    }
  }
}

resource "aws_instance" "mos_ec2" {
  ami              = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type    = "t3.micro"
  subnet_id        = var.subnet_id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [var.sg_id]
  key_name         = "forallkeypair_rdp"
  

   tags = {
    Name        = "me-ec2"
    Managed_by  = "terraform"
  }
}