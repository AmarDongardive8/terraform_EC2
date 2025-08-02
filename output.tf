output "ec2-public-ip" {
    value = aws_instance.my-instance.public_ip
  
}

output "ec2-private-ip" {
    value = aws_instance.my-instance.private_ip
  
}

output "ec2-dns" {
    value = aws_instance.my-instance.public_dns
  
}