provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_ip_range}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = "${var.vpc_tags}"
}

resource "aws_subnet" "subnet" {
  cidr_block        = "${cidrsubnet(aws_vpc.vpc.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.vpc.id}"
  availability_zone = "us-east-1a"

  tags = "${var.subnet_tags}"
}

resource "aws_security_group" "security_group" {
  name = "firewall_${var.project_name}"

  vpc_id = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = "${var.i_from_port}"
    to_port     = "${var.i_to_port}"
    protocol    = "tcp"
    cidr_blocks = "${var.i_ip_range}"
  }

  egress {
    from_port   = "${var.e_from_port}"
    to_port     = "${var.e_to_port}"
    protocol    = "-1"
    cidr_blocks = "${var.e_ip_range}"
  }

  tags = "${var.sg_tags}"
}

resource "aws_instance" "server" {
  ami           = "${var.ami}"
  instance_type = "${var.instance_type}"

  user_data = "${var.user_data}"

  security_groups = ["${aws_security_group.security_group.id}"]

  subnet_id = "${aws_subnet.subnet.id}"

  tags = "${var.instance_tags}"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.server.id}"
  vpc      = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.vpc.id}"

  tags = "${var.gw_tags}"
}

resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "${var.route_ips}"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = "${var.route_tags}"
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.subnet.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}