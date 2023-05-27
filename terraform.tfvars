ec2_type               = "t2.micro"
bucket_name            = "terraform-statee-buckett"
dynamodb_table_name    = "terraform-statee-buckett-table"
billing_mode           = "PAY_PER_REQUEST"
hash_key_name          = "LockID"
vpc_cidr               = "10.0.0.0/16"
public_subnets_cidr    = ["10.0.0.0/24", "10.0.2.0/24"]
public_subnets_map_ip  = [true, true]
private_subnets_cidr   = ["10.0.1.0/24", "10.0.3.0/24"]
private_subnets_map_ip = [false, false]
subnets_az             = ["us-east-1a", "us-east-1b"]


