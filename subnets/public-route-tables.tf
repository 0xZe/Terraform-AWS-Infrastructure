#public subnet route table
resource "aws_route_table" "public_rt" {
  vpc_id = var.appvpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.internet_gateway_id
  }
}


#public subnet1  assosiation
resource "aws_route_table_association" "public_rt_asso" {
  subnet_id      = aws_subnet.public_subnets[0].id
  route_table_id = aws_route_table.public_rt.id
}



#public subnet2  assosiation
resource "aws_route_table_association" "public_rt_asso2" {
  subnet_id      = aws_subnet.public_subnets[1].id
  route_table_id = aws_route_table.public_rt.id
}


