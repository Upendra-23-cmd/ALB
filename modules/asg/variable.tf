variable "vpc_id" {
    description = "VPC ID for the ASG to be created in"
    type        = string
}

variable "launch_template_id" {
    description = "ID of the launch template to be used for the ASG"
    type        = string
}

variable "subnet_ids" {
    description = "List of subnet IDs for the ASG to be created in"
    type        = list(string)
}

variable "target_group_arns" {
    description = "List of target group ARNs to attach to the ASG"
    type        = list(string)
}

variable "autoscaling_group_name" {
    description = "Name of the Auto Scaling group"
    type        = string
    default     = "my-asg"
  
}