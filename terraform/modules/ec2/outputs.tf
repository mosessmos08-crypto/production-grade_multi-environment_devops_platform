output "ec2_public_ip" {
    value = aws_instance.mos_ec2.public_ip
  
}