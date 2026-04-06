output "vpc_id" {
    description = "VPC ID for the created VPC"
    value = aws_vpc.my_vpc.id
}

output "subnet_id" {
    description = "Subnet ID for the created subnet"
    value = [for key, subnet in aws_subnet.my_subnet : subnet.id]
}

output "internet_gateway_id" {
    description = "Internet Gateway ID for the created internet gateway"
    value = aws_internet_gateway.my_igw.id
}