resource "aws_instance" "pubic-server-1" {
  tags = {
    "Name" = "public-server1"
  }
  ami               = "ami-04e5276ebb8451442"
  instance_type     = "t2.micro"
  key_name          = "aws_us"
  subnet_id         = aws_subnet.publicsubnet1a.id
  security_groups   = [aws_security_group.public-sg.id]
  availability_zone = "us-east-1a"
}

resource "aws_instance" "public-server-2" {
  tags = {
    "Name" = "public-server2"
  }
  ami               = "ami-04e5276ebb8451442"
  instance_type     = "t2.micro"
  key_name          = "aws_us"
  subnet_id         = aws_subnet.publicsubnet1b.id
  security_groups   = [aws_security_group.public-sg.id]
  availability_zone = "us-east-1b"
}