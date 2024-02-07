resource "aws_vpc" "openshift_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name  = "${var.owner}-openshift-vpc-tf"
    Owner = var.owner
  }
}

resource "aws_subnet" "openshift_subnet" {
  vpc_id            = aws_vpc.openshift_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = var.aws_availability_zone

  tags = {
    Name  = "${var.owner}-openshift-subnet-tf"
    Owner = var.owner
  }
}

resource "aws_internet_gateway" "openshift_igw" {
  vpc_id = aws_vpc.openshift_vpc.id

  tags = {
    Name  = "${var.owner}-openshift-igw-tf"
    Owner = var.owner
  }
}

resource "aws_route_table" "openshift_rtb" {
  vpc_id = aws_vpc.openshift_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.openshift_igw.id
  }

  tags = {
    Name  = "${var.owner}-openshift-rtb-tf"
    Owner = var.owner
  }
}

resource "aws_route_table_association" "openshift_route_table_associations" {
  subnet_id      = aws_subnet.openshift_subnet.id
  route_table_id = aws_route_table.openshift_rtb.id
}