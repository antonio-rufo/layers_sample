output "nat_gateway_eip" {
  description = "The NAT gateway EIP(s) of the Base Network."
  value       = "${module.vpc.nat_gateway_eip}"
}

output "private_route_tables" {
  description = "The private route tables of the Base Network."
  value       = "${module.vpc.private_route_tables}"
}

output "private_subnets" {
  description = "The private subnets of the Base Network."
  value       = "${module.vpc.private_subnets}"
}

output "public_route_tables" {
  description = "The public route tables of the Base Network."
  value       = "${module.vpc.public_route_tables}"
}

output "public_subnets" {
  description = "The public subnets of the Base Network."
  value       = "${module.vpc.public_subnets}"
}

output "vpc_id" {
  description = "The VPC ID of the Base Network."
  value       = "${module.vpc.vpc_id}"
}
