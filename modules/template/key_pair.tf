resource "tls_private_key" "my_temp_key" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "local_file" "my_private_key" {
    content = tls_private_key.my_temp_key.private_key_pem
    filename = "${path.module}/my_temp_key.pem"
    file_permission = "0600"
}

resource "aws_key_pair" "key_pair" {
    key_name = "my-temp-key"
    public_key = tls_private_key.my_temp_key.public_key_openssh
}

