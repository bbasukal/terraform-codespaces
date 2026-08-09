variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}


variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc-for-modules-lab"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = list(string)
  default     = ["logs","data"]
}
