terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.46.0"
    }
  }
}

# 1. VPC

resource "aws_vpc" "vpc_1" {
  cidr_block    = "10.0.0.0/16"

  tags = {
    Name        = "multi-env-vpc"
    Managed_by  = "terraform"
  }
}
# 2. Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_1.id

  tags = {
    Name        = "me-igw"
    Managed_by  = "terraform"
  }
}
# 3. Public Subnet 1

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc_1.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name        = "me-pub sub"
    Managed_by  = "terraform"
  }
}

# 5. Public RT 1

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name        = "me-pub-rt"
    Managed_by  = "terraform"
  }
}

# 7. Public subnet 1 association

resource "aws_route_table_association" "public_assn" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


# 9. Security Group 1

resource "aws_security_group" "sg_1" {
  name        = "me-sg"
  vpc_id      = aws_vpc.vpc_1.id

  tags = {
    Name        = "me-sg"
    Managed_by  = "terraforrm"
  }


  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

   ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]



  }
}