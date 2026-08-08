variable "environment" {
  description = "The environment for the resources (e.g., dev, staging, prod)"
  type        = string
  default     = "production"
   
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type = string
  default = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for public subnet"
  type = string
  default = "10.0.1.0/24"
}

variable "project_name" {
  description = "Project name for tagging resources"
  type        = string
  default     = "dynamic-infrastructure"
}   

