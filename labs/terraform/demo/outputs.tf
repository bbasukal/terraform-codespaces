output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}



output "sg_id" {
  description = "The ID of the security group"
  value       = module.security-group.id
}