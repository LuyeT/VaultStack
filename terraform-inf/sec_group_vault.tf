resource "aws_security_group" "allow_vault_myIP" {
  name        = "Allow_vault_myIP"
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
    Name = "Allow_vault_myIP"
  }
}

resource "aws_security_group" "allow_vault_VPC" {
  name        = "Allow_vault_VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "vault-http"
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["10.10.10.0/23"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Allow_vault_VPC"
  }
}
