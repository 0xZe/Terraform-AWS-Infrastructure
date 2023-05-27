# vpc with cidr 10.0.0.0/16
resource "aws_vpc" "appvpc" {
  cidr_block = var.vpc_cidr
}


