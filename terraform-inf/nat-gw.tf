resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.inet_gw_1]
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.inet_gw_1]
}

resource "aws_nat_gateway" "nat_gw_1" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public_1.id
}
