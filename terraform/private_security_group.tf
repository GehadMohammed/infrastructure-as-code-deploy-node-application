
resource "aws_security_group" "private-security-group" {

  name = "private-security-group"
  description = "Allow SSH and port 3000 inbound connections"
  vpc_id = module.network.vpc-01-id

  tags = {
    Name        = "private-security-group"
  }

}
resource "aws_security_group_rule" "ingress_in_ssh" {

  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.vpc-01-cidr-block]
  security_group_id = aws_security_group.private-security-group.id

}

resource "aws_security_group_rule" "ingress_in_3000" {

  type              = "ingress"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [var.vpc-01-cidr-block]
  security_group_id = aws_security_group.private-security-group.id

}

resource "aws_security_group_rule" "egress" {

  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private-security-group.id

}
