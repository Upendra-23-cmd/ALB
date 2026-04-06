resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id

    for_each = {
      "subnet1" = {
       cidr_block =  "10.0.1.0/24"
       availability_zone = "us-east-1a"
      }
      "subnet2" = {
       cidr_block =  "10.0.2.0/24"
       availability_zone = "us-east-1b"
      }
      "subnet3" = {
       cidr_block =  "10.0.3.0/24"
       availability_zone = "us-east-1c"
      }
    }
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone

    tags = {
        Name = "my-subnet"
    }
}

resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "my-igw"
    }
}

resource "aws_route_table" "my_rt_table" {
    vpc_id = aws_vpc.my_vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my_igw.id
    }

    tags = {
        Name = "my-rt-table"
    }
}

resource "aws_route_table_association" "my_rt_table_association"{
     for_each = aws_subnet.my_subnet
    subnet_id = each.value.id
    
    route_table_id = aws_route_table.my_rt_table.id
}

