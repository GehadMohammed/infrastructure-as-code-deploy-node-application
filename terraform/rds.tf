resource "aws_db_parameter_group" "default-01" {
  name   = "rds-pg"
  family = "mysql8.0"

  parameter {
    name  = "character_set_server"
    value = "utf8"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8"
  }
}

resource "aws_db_subnet_group" "default-01" {
  name       = "main"
  subnet_ids = [ module.network.private-subnet-01-id , module.network.private-subnet-02-id ]

  tags = {
    Name = "My DB subnet group"
  }
}


resource "aws_db_instance" "rds-gehad-01" {
  allocated_storage    = 100
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t2.micro"
  identifier           = "mydb"
  db_name              = "mydb"
  username             = "root"
  password             = "12345678"
  parameter_group_name = aws_db_parameter_group.default-01.id
  db_subnet_group_name = aws_db_subnet_group.default-01.id
  vpc_security_group_ids = [ aws_security_group.rds-sg.id ]
  publicly_accessible  = false
  skip_final_snapshot  = true
  multi_az             = false
}