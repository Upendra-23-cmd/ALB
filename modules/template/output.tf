output "my_sg" {
    description = "Security group ID for the created security group"
    value = aws_security_group.my_sg.id
}

output "ports" {
  value = [for rule in aws_security_group.my_sg.ingress : rule.from_port]
}
output "key" {
    description = "Value of the key_pair"
    value = aws_key_pair.key_pair.key_name
}

output "template_id" {
    description = "ID of the created template"
    value = aws_launch_template.my_template.id
}