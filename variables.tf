variable "aws-ec2-type" {
    default = "t2.medium"
    type = string  
}

variable "root-volume" {
    default = 20
    type = number
}

variable "instance_names" {
  default = {
    instance-micro = "t2.micro"
    instance-medium = "t2.micro"
  }
}