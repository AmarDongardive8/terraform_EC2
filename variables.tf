variable "aws-ec2-type" {
    default = "t2.medium"
    type = string  
}

variable "root-volume" {
    default = 20
    type = number
}