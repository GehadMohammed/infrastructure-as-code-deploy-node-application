resource "aws_route_table_association" "c" {
  subnet_id      = aws_subnet.private-subnet-01.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_subnet" "private-subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = var.private-subnet-01-cidr_block
  availability_zone="${var.env_region}a"
  

  tags = {
    Name = "${var.name}-private-subnet-01-G"
  }
}

resource "aws_route_table_association" "d" {
  subnet_id      = aws_subnet.private-subnet-02.id
  route_table_id = aws_route_table.private-rt.id
}

resource "aws_subnet" "private-subnet-02" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = var.private-subnet-02-cidr_block
  availability_zone="${var.env_region}b"

  tags = {
    Name = "${var.name}-private-subnet-02-G"
  }
}