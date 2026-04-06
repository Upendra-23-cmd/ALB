variable "vpc_id" {
    description = "VPC ID for the ALB to be created in"
    type        = string
}

variable "security_groups" {
    description = "List of security group IDs to attach to the ALB"
    type        = list(string)
}

variable "subnet_ids" {
    description = "List of subnet IDs for the ALB to be created in"
    type        = list(string)
}


