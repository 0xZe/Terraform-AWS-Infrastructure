resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name


  #prevent deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

}

resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }

}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_table_name
  billing_mode = var.billing_mode
  hash_key     = var.hash_key_name


  attribute {
    name = var.hash_key_name
    type = "S"
  }

}


terraform {
  backend "s3" {
    bucket         = var.bucket_name
    key            = "state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = var.dynamodb_table_name
  }
}
















