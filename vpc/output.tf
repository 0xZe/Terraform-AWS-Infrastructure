#output "app_vpc_id" {
#  value = aws_vpc.myvpc.id
#}
output "appvpc_id" {
  value = aws_vpc.appvpc.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id

}

