
resource "aws_instance" "Bastion" {
  ami                    = "ami-073a8e22592a4a925"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_myIP.id]
  key_name               = "AWS-standard"

  tags = {
    Name = "vaultstack-bastion-test"
  }
}

resource "aws_instance" "Vaultserver" {
  ami                    = "ami-073a8e22592a4a925"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_1.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_myIP.id, aws_security_group.allow_vault-http_myIP.id]
  key_name               = "AWS-standard"

  tags = {
    Name = "vaultstack-server"
  }
}
resource "aws_instance" "DBserver" {
  ami                    = "ami-073a8e22592a4a925"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_all.id]
  key_name               = "disposable-key"

  tags = {
    Name = "vaultstack-private-test"
  }
}
