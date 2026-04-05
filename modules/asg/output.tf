output "asg_id" {
    description = "ID of the created Auto Scaling group"
    value = aws_autoscaling_group.my_asg.id
}

