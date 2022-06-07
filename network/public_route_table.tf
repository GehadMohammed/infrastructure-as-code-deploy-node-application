
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route" "public-route-ipv4"{
  route_table_id = aws_route_table.public-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_egress_only_internet_gateway" "egress" {
  vpc_id = aws_vpc.vpc-01.id
}

resource "aws_route" "public-route-ipv6" {
  route_table_id              = aws_route_table.public-rt.id
  destination_ipv6_cidr_block = "::/0"
  egress_only_gateway_id      = aws_egress_only_internet_gateway.egress.id
}
