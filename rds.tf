resource "aws_db_subnet_group" "subnet-group" {
  name       = "production-db-subnet-group"
  subnet_ids = [aws_subnet.privatesubnet1a-DB.id, aws_subnet.privatesubnet1b-DB.id]
}

resource "aws_db_instance" "rds-db" {
  identifier             = "production-rds-db"
  allocated_storage      = 20
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.m5d.large"
  username               = "prasad"
  password               = "abcd12345678"
  publicly_accessible    = false
  db_subnet_group_name   = aws_db_subnet_group.subnet-group.name
  vpc_security_group_ids = [aws_security_group.rds-sg.id]
  skip_final_snapshot    = true
}