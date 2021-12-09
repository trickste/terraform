output "arn" {
  value = aws_vpc.vpc[0].arn
}

output "id" {
  value = aws_vpc.vpc[0].id
}

output "cidr_block" {
  value = aws_vpc.vpc[0].cidr_block
}

output "instance_tenancy" {
  value = aws_vpc.vpc[0].instance_tenancy
}

output "enable_dns_support" {
  value = aws_vpc.vpc[0].enable_dns_support
}

output "enable_dns_hostnames" {
  value = aws_vpc.vpc[0].enable_dns_hostnames
}

output "main_route_table_id" {
  value = aws_vpc.vpc[0].main_route_table_id
}

output "owner_id" {
  value = aws_vpc.vpc[0].owner_id
}

output "tags" {
  value = aws_vpc.vpc[0].tags_all
}

############## IGW ##############

output "igw_id" {
  value = var.create_igw ? module.igw[0].id : null
}

output "igw_arn" {
  value = var.create_igw ? module.igw[0].arn : null
}

output "igw_owner_id" {
  value = var.create_igw ? module.igw[0].owner_id : null
}

output "igw_tags" {
  value = var.create_igw ? module.igw[0].tags : null
}

######### PUBLIC SUBNET #########

output "public_subnet_ids" {
  value = length(module.public_subnet) > 0 ? module.public_subnet[*].id : null
}

output "public_subnet_arns" {
  value = length(module.public_subnet) > 0 ? module.public_subnet[*].arn : null
}

output "public_subnet_ipv6_cidr_block_association_ids" {
  value = length(module.public_subnet) > 0 ? module.public_subnet[*].ipv6_cidr_block_association_id : null
}

output "public_subnet_tags" {
  value = length(module.public_subnet) > 0 ? module.public_subnet[*].tags : null
}

output "public_subnet_cidr" {
  value = length(module.public_subnet) > 0 ? module.public_subnet[*].cidr : null
}
######### PRIVATE SUBNET ########

output "private_subnet_ids" {
  value = length(module.private_subnet) > 0 ? module.private_subnet[*].id : null
}

output "private_subnet_arns" {
  value = length(module.private_subnet) > 0 ? module.private_subnet[*].arn : null
}

output "private_subnet_ipv6_cidr_block_association_ids" {
  value = length(module.private_subnet) > 0 ? module.private_subnet[*].arn : null
}

output "private_subnet_tags" {
  value = length(module.private_subnet) > 0 ? module.private_subnet[*].tags : null
}

output "private_subnet_cidr" {
  value = length(module.private_subnet) > 0 ? module.private_subnet[*].cidr : null
}

######### PROTECTED SUBNET ########

output "protected_subnet_ids" {
  value = length(module.protected_subnet) > 0 ? module.protected_subnet[*].id : null
}

output "protected_subnet_arns" {
  value = length(module.protected_subnet) > 0 ? module.protected_subnet[*].arn : null
}

output "protected_subnet_ipv6_cidr_block_association_ids" {
  value = length(module.protected_subnet) > 0 ? module.protected_subnet[*].arn : null
}

output "protected_subnet_tags" {
  value = length(module.protected_subnet) > 0 ? module.protected_subnet[*].tags : null
}

output "protected_subnet_cidr" {
  value = length(module.protected_subnet) > 0 ? module.protected_subnet[*].cidr : null
}