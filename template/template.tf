resource "aws_template" "my_template" {
    ami_id = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key_pair.key_name

    root_volume {
        size = var.root_volume_size
        type = var.root_volume_type
    }

    network_interface {
        device_index = 0
        subnet_id = aws_subnet.my_subnet.id
        security_group = aws_security_group.my_sg.id
    }

        user_data = base64encode(<<-EOF
                    #!/bin/bash
                    sudo apt update -y
                    sudo apt install nginx -y
                    sudo systemctl start nginx 
                    sudo systemctl enable nginx
                    EOF
        )

        tags = {
            Name = "my-template"
        }
}