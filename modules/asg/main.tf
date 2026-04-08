resource "aws_autoscaling_group" "my_asg" {
    name = "my-asg"
    max_size = 3
    min_size = 2
    desired_capacity = 2
    launch_template {
        id = var.launch_template_id
        version = "$Latest"
    }
    depends_on = [ var.vpc_id ]
    vpc_zone_identifier = var.subnet_ids
    target_group_arns = var.target_group_arns

    }
    
resource "aws_autoscaling_policy" "cpu_utilization_policy" {
  name                   = "cpu-utilization-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = var.autoscaling_group_name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50
  }
    depends_on = [ aws_autoscaling_group.my_asg ]
  estimated_instance_warmup = 300
}