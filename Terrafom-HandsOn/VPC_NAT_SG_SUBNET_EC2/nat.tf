#Define External IP 
resource "aws_eip" "realtechie-eip" {
  vpc = true
}

resource "aws_nat_gateway" "realtechie-ngw" {
  allocation_id = aws_eip.realtechie-eip.id
  subnet_id     = aws_subnet.realtechiePub-Sub1.id
  depends_on    = [aws_internet_gateway.realtechie-igw]
}

resource "aws_route_table" "realtechie-Pri-Rt" {
  vpc_id = aws_vpc.realtechie.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.realtechie-ngw.id
  }

  tags = {
    Name = "realtechie-Pri-Rt"
  }
}

# route associations private
resource "aws_route_table_association" "realtechiePriAss1a" {
  subnet_id      = aws_subnet.realtechiePri-Sub1.id
  route_table_id = aws_route_table.realtechie-Pri-Rt.id
}

resource "aws_route_table_association" "realtechiePriAss1b" {
  subnet_id      = aws_subnet.realtechiePri-Sub2.id
  route_table_id = aws_route_table.realtechie-Pri-Rt.id
}
resource "aws_route_table_association" "realtechiePriAss1c" {
  subnet_id      = aws_subnet.realtechiePri-Sub3.id
  route_table_id = aws_route_table.realtechie-Pri-Rt.id
}