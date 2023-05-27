output "external_load_balancer_dns" {
  value = aws_lb.external_load_balancer.dns_name

}

output "internal_load_balancer_dns" {
  value = aws_lb.internal_load_balancer.dns_name

}
