variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
  default     = ""  
}

variable "subnet_cidrs" {
  description = "A list of CIDR blocks for the subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "availability_zones" {
  description = "A list of availability zones for the subnets"
  type        = list(string)
  default     = ["us-east-1a"]  
}

variable "subnet_name" {
  description = "The name of the subnets"
  type        = string
  default     = "my-subnet"
}