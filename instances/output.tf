output "sg_id" {
  value = [aws_security_group.sg.id]
}
output "public_ec2_id" {
  value = aws_instance.public_ec2s[0].id
}

output "private_ec2_id" {

  value = aws_instance.private_ec2s[0].id
}

output "public_ec22_id" {
  value = aws_instance.public_ec2s[1].id
}

output "private_ec22_id" {
  value = aws_instance.private_ec2s[1].id
}




