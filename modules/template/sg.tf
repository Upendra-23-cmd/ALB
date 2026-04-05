resource "aws_security_group" "my_sg" {
    name = "my-sg"
    description = "Security group for my ALB"
    vpc_id = var.vpc_id

    # INBOUND RULES
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    # OUTBOUND RULES
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
    }

    tags = {
        Name = "my-sg"
    }
}