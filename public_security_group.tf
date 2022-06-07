
resource "aws_security_group" "public-security-group" {

  name = "allow_ssh_security_group"
  description = "Allow SSH inbound connections"
  vpc_id = module.network.vpc-01-id

  tags = {
    Name        = "allow_ssh_security_group"
  }

}

resource "aws_security_group_rule" "public_in_ssh" {

  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public-security-group.id

}

resource "aws_security_group_rule" "public_ingress" {

  type              = "ingress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public-security-group.id

}
 
resource "aws_security_group_rule" "public_egress" {

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public-security-group.id

}