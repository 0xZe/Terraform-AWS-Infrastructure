variable "public_subnets_cidr" {
  type = list(any)
}
variable "public_subnets_map_ip" {
  type = list(any)
}
variable "private_subnets_cidr" {
  type = list(any)
}
variable "private_subnets_map_ip" {
  type = list(any)
}
variable "appvpc_id" {
  type = string
}
variable "internet_gateway_id" {
  type = string
}
variable "subnets_az" {
  type = list(any)
}
