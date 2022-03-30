resource "aws_security_group" "allow_ssh_all" {
  name        = "Allow_ssh_all"
  description = "Allow ssh from all hosts"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSHC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow_ssh_all"
  }
}

data "http" "myIP" {
  url = "https://ipv4.icanhazip.com"
}

resource "aws_security_group" "allow_ssh_myIP" {
  name        = "Allow_ssh_myIP"
  description = "Allow ssh from execution environment"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.myIP.body)}/32"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow_ssh_all"
  }
}
