
variable "ec2_type" {
  type = string
}

variable "bucket_name" {
  type = string
}
variable "dynamodb_table_name" {
  type = string
}
variable "billing_mode" {
  type = string
}
variable "hash_key_name" {
  type = string
}
variable "vpc_cidr" {
  type = string

}
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
variable "subnets_az" {
  type = list(any)
}







