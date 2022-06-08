
resource "aws_eip" "eip" {
  vpc      = true

  tags = {
    Name = "EIP-Gehad"
  }

}
resource "aws_nat_gateway" "natgw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnet-01.id

  tags = {
    Name = "${var.name}-natgw-G"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}