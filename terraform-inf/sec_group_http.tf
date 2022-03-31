resource "aws_security_group" "allow_http_all" {
  name        = "Allow_http_all"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
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
    Name = "Allow_http_all"
  }
}

resource "aws_security_group" "allow_vault-http_myIP" {
  name        = "Allow_vault-http_myIP"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "vault-http"
    from_port   = 8200
    to_port     = 8200
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
    Name = "Allow_vault-http_myIP"
  }
}
