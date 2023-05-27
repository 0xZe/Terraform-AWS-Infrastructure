variable "appvpc_id" {
  type = string
}
variable "public_subnets_id" {
  type = list(any)
}
variable "private_subnets_id" {
  type = list(any)
}
variable "sg_id" {
  type = list(any)

}
variable "public_ec2s_id" {
  type = list(any)

}
variable "private_ec2s_id" {
  type = list(any)

}