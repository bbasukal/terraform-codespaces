data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "demo-vpc"
}

module "subnets" {
  source             = "./modules/subnets"
  vpc_id             = module.vpc.vpc_id
  subnet_cidrs       = ["10.0.1.0/24"]
  subnet_name        = "demo-subnet"
  availability_zones = ["us-east-1a"]
}

module "prod-workload" {
  source        = "./modules/ec2"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = module.subnets.subnet_ids[0]
  ami           = data.aws_ami.amazon_linux_2023.id
  instance_type = "t2.micro"
  instance_name = "demo-webserver-instance"
  name          = "demo-webserver-sg"
  description   = "Security group for the demo webserver"
}