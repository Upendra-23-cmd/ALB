variable "region" {
    description = "AWS region to deploy resources in"
    type       = string
    default     = "us-east-1"
}

variable "enviroment" {
    description = "Enviroment to deploy resources in"
    type       = string
    default     = "Custom vpc with public and private subnets"
 }

 variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type     = string
    default     = "ami-0ec10929233384c7f" # Amazon Linux 2 AMI (HVM), SSD Volume Type
 } 
 
 variable "instance_type"{
    description = "Instance type for the Ec2 instance"
    type    = string
    default = "t2.micro"   
 }

 variable "root_volume_size" {
    description = "Size of the root volume in GB"
    type   = number
    default = 8
 }

variable "root_volume_type" {
    description = "The type of root volume to use for the EC2 instance"
    type   = string
    default = "gp3"
}

