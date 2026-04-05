resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "my-vpc"
    }
}

resource "aws_subnet" "my_subnet" {
    vpc_id = aws_vpc.my_vpc.id

    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "my-subnet"
    }

}
resource "aws_subnet" "my_subnet_1" {
    vpc_id = aws_vpc.my_vpc.id

    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "my-subnet"
    }

}

resource "aws_subnet" "my_subnet_2" {
    vpc_id = aws_vpc.my_vpc.id

    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1c"

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

    tags = {
        Name = "my-rt-table"
    }
}

resource "aws_route_table_association" "my_rt_table_association"{
    subnet_id = aws_subnet.my_subnet.id
    route_table_id = aws_route_table.my_rt_table.id
}