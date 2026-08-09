# Add resource blocks below
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.15.4"
  
  bucket_prefix = "${var.environment}-modules-lab-"

  #S3 bucket - level public access block configuration
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  versioning = {
    enabled = true
  }

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }

}

module "s3_buckets" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.15.4"

   for_each = toset(var.bucket_name)
   bucket_prefix = "${var.environment}-${each.value}-"

   tags = {
     Environment = var.environment
     Terraform   = "true"
     Name        = each.value
   }

 
}



module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  cidr = var.cidr_block
  name = "${var.environment}-modules-lab-vpc"
  region = var.region

    azs             = ["${var.region}a"]
    private_subnets = ["10.0.1.0/24","10.0.2.0/24"]
    public_subnets  = ["10.0.101.0/24","10.0.102.0/24"]
    
    tags = {
      Environment = var.environment
      Terraform   = "true"
    }
}
