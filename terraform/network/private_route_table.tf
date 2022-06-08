
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.vpc-01.id

  tags = {
    Name = "${var.name}-private-rt"
  }
}

resource "aws_route" "private-route-ipv4"{
  route_table_id = aws_route_table.private-rt.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id   = aws_nat_gateway.natgw.id
}
