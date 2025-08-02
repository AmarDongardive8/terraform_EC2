# output "ec2-public-ip" {
#     value = aws_instance.my-instance.public_ip
  
# }

# output "ec2-private-ip" {
#     value = aws_instance.my-instance.private_ip
  
# }

# output "ec2-dns" {
#     value = aws_instance.my-instance.public_dns
  
# }

# # because of meta argument
# output "ec2-public-ip" {
#     value = aws_instance.my-instance.*.public_ip
  
# }

# output "ec2-private-ip" {
#     value = aws_instance.my-instance.*.private_ip
  
# }

# output "ec2-dns" {
#     value = aws_instance.my-instance.*.public_dns
  
# }

# because of for_each
output "public_ip" {
  value = {
    for name , instance in aws_instance.my-instance : name => instance.public_ip
  }
}
output "private_ip" {
  value = {
    for name, instance in aws_instance.my-instance : name => instance.private_ip
  }
}
output "public_dns" {
  value = {
    for name,instance in aws_instance.my-instance : name => instance.public_dns
  }
}


