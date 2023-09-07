#Create AWS VPC
resource "aws_vpc" "realtechie" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  #enable_classiclink   = "false"

  tags = {
    Name = "realtechie-vpc"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "realtechiePub-Sub1" {
  vpc_id                  = aws_vpc.realtechie.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "realtechiePub-Sub1"
  }
}

resource "aws_subnet" "realtechiePub-Sub2" {
  vpc_id                  = aws_vpc.realtechie.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "realtechiePub-Sub2"
  }
}

resource "aws_subnet" "realtechiePub-Sub3" {
  vpc_id                  = aws_vpc.realtechie.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "realtechiePub-Sub3"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "realtechiePri-Sub1" {
  vpc_id                  = aws_vpc.realtechie.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1a"

  tags = {
    Name = "realtechiPri-Sub1"
  }
}

resource "aws_subnet" "realtechiePri-Sub2" {
  vpc_id                  = aws_vpc.realtechie.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1b"

  tags = {
    Name = "realtechiePri-Sub2"
  }
}

resource "aws_subnet" "realtechiePri-Sub3" {
  vpc_id                  = aws_vpc.realtechie.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-1c"

  tags = {
    Name = "realtechiePri-Sub3"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "realtechie-igw" {
  vpc_id = aws_vpc.realtechie.id

  tags = {
    Name = "realtechie-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "realtechie-Pub-Rt" {
  vpc_id = aws_vpc.realtechie.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.realtechie-igw.id
  }
    tags = {
    Name = "realtechie-Pub-Rt"
  }
}

resource "aws_route_table_association" "realtechiePub-Sub1-A" {
  subnet_id      = aws_subnet.realtechiePub-Sub1.id
  route_table_id = aws_route_table.realtechie-Pub-Rt.id
}

resource "aws_route_table_association" "realtechiePub-Sub2-A" {
  subnet_id      = aws_subnet.realtechiePub-Sub2.id
  route_table_id = aws_route_table.realtechie-Pub-Rt.id
}

resource "aws_route_table_association" "realtechiePub-Sub3-A" {
  subnet_id      = aws_subnet.realtechiePub-Sub3.id
  route_table_id = aws_route_table.realtechie-Pub-Rt.id
}
