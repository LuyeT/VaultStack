# subnets
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet

resource "aws_subnet" "private_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.0/25"

  availability_zone = "eu-central-1a"

  tags = {
    Name = "private_1_eu-central-1a"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.11.0/25"

  availability_zone       = "eu-central-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_1_eu-central-1a"
  }
}

resource "aws_subnet" "private_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.10.128/25"

  availability_zone = "eu-central-1b"

  tags = {
    Name = "private_2_eu-central-1b"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.10.11.128/25"

  availability_zone       = "eu-central-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public_2_eu-central-1a"
  }
}
