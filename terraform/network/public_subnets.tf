
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public-subnet-01.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_subnet" "public-subnet-01" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = var.public-subnet-01-cidr_block
  availability_zone= "${var.env_region}a"
  map_public_ip_on_launch= "true"

  tags = {
    Name = "${var.name}-public-subnet-01-G"
  }
}


resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public-subnet-02.id
  route_table_id = aws_route_table.public-rt.id
}


resource "aws_subnet" "public-subnet-02" {
  vpc_id     = aws_vpc.vpc-01.id
  cidr_block = var.public-subnet-02-cidr_block
  availability_zone="${var.env_region}b"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.name}-public-subnet-02-G"
  }
}