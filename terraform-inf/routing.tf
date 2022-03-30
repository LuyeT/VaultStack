# resource: aws_internet_gateway
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway

resource "aws_internet_gateway" "inet_gw_1" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "inet_gw_1"
  }
}

resource "aws_route_table" "pub1_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.inet_gw_1.id
  }
}

resource "aws_route_table_association" "pub1_association" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.pub1_rt.id
}

resource "aws_route_table" "nat1_rt" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gw_1.id
  }
}

resource "aws_route_table_association" "nat1_association" {
  subnet_id      = aws_subnet.private_1.id
  route_table_id = aws_route_table.nat1_rt.id
}
