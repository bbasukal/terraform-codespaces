module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.6.1"

  cidr = var.cidr_block
  name = var.vpc_name
}


module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "6.0.0"

  vpc_id = module.vpc.vpc_id
  name   = "my-cool-security-group"

}