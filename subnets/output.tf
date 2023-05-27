output "public_subnet_id" {
  value = aws_subnet.public_subnets[0].id
}

output "private_subnet_id" {

  value = aws_subnet.private_subnets[0].id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnets[1].id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnets[1].id
}