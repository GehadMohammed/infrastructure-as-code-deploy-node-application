resource "aws_vpc" "vpc-01" {
  cidr_block       = var.vpc-01-cidr-block
  instance_tenancy = "default"

  tags = {
    Name = "${var.name}-vpc-G"
  }
}