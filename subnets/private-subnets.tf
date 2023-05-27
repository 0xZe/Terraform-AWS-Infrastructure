#private subnets

resource "aws_subnet" "private_subnets" {
  count                   = 2
  vpc_id                  = var.appvpc_id
  cidr_block              = var.private_subnets_cidr[count.index]
  map_public_ip_on_launch = var.private_subnets_map_ip[count.index]
  availability_zone       = var.subnets_az[count.index]

}