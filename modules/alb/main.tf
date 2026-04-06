resource "aws_lb_target_group" "my_target_group" {
    name = "my-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id

    health_check {
  path                = "/"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}


}

resource "aws_lb" "my_alb" {
    name = "my-alb"
    internal = false
    load_balancer_type = "application"
    security_groups = var.security_groups
    subnets = var.subnet_ids

    tags = {
        Name = "my-alb"
    }
}

resource "aws_lb_listener" "my_listener" {
    load_balancer_arn = aws_lb.my_alb.arn
    port = 80
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.my_target_group.arn
    }
}

