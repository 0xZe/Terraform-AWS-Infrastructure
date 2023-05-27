
#Elastic Ip For Nat Gateway
resource "aws_eip" "nat_ip" {

}

#Create Nat Gateway and put it in subnet public1
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_ip.id
  subnet_id     = aws_subnet.public_subnets[0].id ################
}

#################################################################
