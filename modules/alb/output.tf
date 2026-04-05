output "alb_id" {
    description = "ID of the created Application Load Balancer"
    value = aws_lb.my_alb.id
}

output "target_group_arn" {
    description = "ARN of the created target group"
    value = aws_lb_target_group.my_target_group.arn
}

output "listerner_arn" {
    description = "ARN of the created listener"
    value = aws_lb_listener.my_listener.arn
}

output "alb_dns_name" {
    description = "DNS name of the created application load balancer"
    value = aws_lb.my_alb.dns_name
}