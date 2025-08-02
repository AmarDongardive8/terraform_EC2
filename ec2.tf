#key-pair

resource "aws_key_pair" "my_key" {
    key_name = "terra_key_ec2"
    public_key = file("ec2-key.pub")
  
}

#vpc $ security group

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}


resource "aws_security_group" "my_security_group" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_default_vpc.default.id #interpolation

  #inbound_rools
  ingress  {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "nginx"
  }

  ingress  {
    from_port = 8000
    to_port = 8000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "python"
  }

  #outbound_rools

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "all"
  }
 
  tags = {
    Name = "allow_tls"
  }
}

# resource "aws_instance" "my-instance" {
#     key_name = aws_key_pair.my_key.key_name
#     security_groups = [aws_security_group.my_security_group.name]
#     ami           = "ami-01f23391a59163da9"
#     instance_type = var.aws-ec2-type

#     user_data = file("nginx_install.sh")

#     root_block_device {
#         volume_size = var.root-volume
#         volume_type = "gp3"
#     }

#     tags = {
#         Name = "tf-server-testing"
#     }
# }


# resource "aws_instance" "my-instance" {
#     count = 2 # meta argument
#     key_name = aws_key_pair.my_key.key_name
#     security_groups = [aws_security_group.my_security_group.name]
#     ami           = "ami-01f23391a59163da9"
#     instance_type = var.aws-ec2-type

#     user_data = file("nginx_install.sh")

#     root_block_device {
#         volume_size = var.root-volume
#         volume_type = "gp3"
#     }

#     tags = {
#         Name = "tf-server-testing"
#     }
# }

# using for_each
resource "aws_instance" "my-instance" {
    for_each = var.instance_names
    key_name = aws_key_pair.my_key.key_name
    security_groups = [aws_security_group.my_security_group.name]
    ami           = "ami-01f23391a59163da9"
    instance_type = each.value

    user_data = file("nginx_install.sh")

    root_block_device {
        volume_size = var.root-volume
        volume_type = "gp3"
    }

    tags = {
        Name = each.key 
    }
}