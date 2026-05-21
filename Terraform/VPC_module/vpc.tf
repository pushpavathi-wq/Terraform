provider "aws" {
  region = "us-east-1" # Change this to your preferred region
}

resource "aws_vpc" "devops_practice_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "DevOps_Practice_VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.devops_practice_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  
  tags = {
    Name = "DevOps_Practice_Public_Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.devops_practice_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "DevOps_Practice_Private_Subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.devops_practice_vpc.id
  
  tags = {
    Name = "DevOps_Practice_IGW"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.devops_practice_vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  
  tags = {
    Name = "DevOps_Practice_Public_RouteTable"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.devops_practice_vpc.id
  
  tags = {
    Name = "DevOps_Practice_Private_RouteTable"
  }
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_rt.id
}