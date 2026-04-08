resource "aws_launch_template" "my_template" {
    name_prefix = "my-template-"
    image_id = var.ami_id
    instance_type = var.instance_type
    key_name = aws_key_pair.key_pair.key_name

    block_device_mappings {
        device_name = "/dev/xvda"
        ebs {
            volume_size = var.root_volume_size
            volume_type = var.root_volume_type
        }
    }

    network_interfaces {
        associate_public_ip_address = true
        device_index = 0
        subnet_id = var.subnet_id[0]
        security_groups = [aws_security_group.my_sg.id]
    }

       user_data =base64encode(<<-EOF
                #!/bin/bash
                sudo -i
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