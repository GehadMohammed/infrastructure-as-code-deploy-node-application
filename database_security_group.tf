resource "aws_security_group" "rds-sg" {
  name        = "rds-security-group"
  description = "allow inbound access to the database"
  vpc_id      = module.network.vpc-01-id

  ingress {
    description      = "Allow all"
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ var.vpc-01-cidr-block ]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ var.vpc-01-cidr-block ]
  }

}