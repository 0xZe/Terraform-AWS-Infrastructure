#define aws
provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source   = "./vpc"
  vpc_cidr = var.vpc_cidr

}
module "subnets" {
  source                 = "./subnets"
  public_subnets_cidr    = var.public_subnets_cidr
  public_subnets_map_ip  = var.public_subnets_map_ip
  private_subnets_cidr   = var.private_subnets_cidr
  private_subnets_map_ip = var.private_subnets_map_ip
  subnets_az             = var.subnets_az
  appvpc_id              = module.vpc.appvpc_id
  internet_gateway_id    = module.vpc.internet_gateway_id

}

module "instances" {
  source                     = "./instances"
  ec2_type                   = var.ec2_type
  appvpc_id                  = module.vpc.appvpc_id
  public_subnets_id          = [module.subnets.public_subnet_id, module.subnets.public_subnet2_id]
  private_subnets_id         = [module.subnets.private_subnet_id, module.subnets.private_subnet2_id]
  internal_load_balancer_dns = module.load_balancers.internal_load_balancer_dns


}


module "load_balancers" {
  source             = "./load_balancers"
  appvpc_id          = module.vpc.appvpc_id
  public_subnets_id  = [module.subnets.public_subnet_id, module.subnets.public_subnet2_id]
  private_subnets_id = [module.subnets.private_subnet_id, module.subnets.private_subnet2_id]
  sg_id              = [module.instances.sg_id]
  public_ec2s_id     = [module.instances.public_ec2_id, module.instances.public_ec22_id]
  private_ec2s_id    = [module.instances.private_ec2_id, module.instances.private_ec22_id]



}
module "remote-backend" {
  source              = "./remote-backend"
  bucket_name         = var.bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  billing_mode        = var.billing_mode
  hash_key_name       = var.hash_key_name

}





