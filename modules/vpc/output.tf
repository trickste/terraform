############### VPC ###############

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

############### IGW ###############

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

########## PUBLIC SUBNET ##########

output "public_subnet_ids" {
  value = length(var.public_subnet) > 0 ? module.public_subnet[*].id : null
}

output "public_subnet_arns" {
  value = length(var.public_subnet) > 0 ? module.public_subnet[*].arn : null
}

output "public_subnet_ipv6_cidr_block_association_ids" {
  value = length(var.public_subnet) > 0 ? module.public_subnet[*].ipv6_cidr_block_association_id : null
}

output "public_subnet_tags" {
  value = length(var.public_subnet) > 0 ? module.public_subnet[*].tags : null
}

output "public_subnet_cidr" {
  value = length(var.public_subnet) > 0 ? module.public_subnet[*].cidr : null
}

#### PUBLIC SUBNET ROUTE TABLE ####

output "public_route_table_ids" {
  value = length(var.public_subnet) > 0 ? module.public_route_table[*].id : null
}

output "public_route_table_arns" {
  value = length(var.public_subnet) > 0 ? module.public_route_table[*].arn : null
}

output "public_route_table_tags" {
  value = length(var.public_subnet) > 0 ? module.public_route_table[*].tags : null
}

########## PRIVATE SUBNET #########

output "private_subnet_ids" {
  value = length(var.private_subnet) > 0 ? module.private_subnet[*].id : null
}

output "private_subnet_arns" {
  value = length(var.private_subnet) > 0 ? module.private_subnet[*].arn : null
}

output "private_subnet_ipv6_cidr_block_association_ids" {
  value = length(var.private_subnet) > 0 ? module.private_subnet[*].arn : null
}

output "private_subnet_tags" {
  value = length(var.private_subnet) > 0 ? module.private_subnet[*].tags : null
}

output "private_subnet_cidr" {
  value = length(var.private_subnet) > 0 ? module.private_subnet[*].cidr : null
}

#### PRIVATE SUBNET ROUTE TABLE ###

output "private_route_table_ids" {
  value = length(var.private_subnet) > 0 ? module.private_route_table[*].id : null
}

output "private_route_table_arns" {
  value = length(var.private_subnet) > 0 ? module.private_route_table[*].arn : null
}

output "private_route_table_tags" {
  value = length(var.private_subnet) > 0 ? module.private_route_table[*].tags : null
}

############### IGW ###############

output "nat_id" {
  value = length(var.private_subnet) > 0 ? module.nat[*].id : null
}

output "nat_allocation_id" {
  value = length(var.private_subnet) > 0 ? module.nat[*].allocation_id : null
}

output "nat_subnet_id" {
  value = length(var.private_subnet) > 0 ? module.nat[*].subnet_id : null
}

output "nat_tags" {
  value = length(var.private_subnet) > 0 ? module.nat[*].tags : null
}

######### PROTECTED SUBNET ########

output "protected_subnet_ids" {
  value = length(var.protected_subnet) > 0 ? module.protected_subnet[*].id : null
}

output "protected_subnet_arns" {
  value = length(var.protected_subnet) > 0 ? module.protected_subnet[*].arn : null
}

output "protected_subnet_ipv6_cidr_block_association_ids" {
  value = length(var.protected_subnet) > 0 ? module.protected_subnet[*].arn : null
}

output "protected_subnet_tags" {
  value = length(var.protected_subnet) > 0 ? module.protected_subnet[*].tags : null
}

output "protected_subnet_cidr" {
  value = length(var.protected_subnet) > 0 ? module.protected_subnet[*].cidr : null
}

### PROTECTED SUBNET ROUTE TABLE ##

output "protected_route_table_ids" {
  value = length(var.protected_subnet) > 0 ? module.protected_route_table[*].id : null
}

output "protected_route_table_arns" {
  value = length(var.protected_subnet) > 0 ? module.protected_route_table[*].arn : null
}

output "protected_route_table_tags" {
  value = length(var.protected_subnet) > 0 ? module.protected_route_table[*].tags : null
}


########### DEFAULT NACL ##########

output "default_nacl_id" {
  value = length(module.default_nacl) > 0 ? module.default_nacl[*].id : null
}

output "default_nacl_arn" {
  value = length(module.default_nacl) > 0 ? module.default_nacl[*].arn : null
}

output "default_nacl_tags" {
  value = length(module.default_nacl) > 0 ? module.default_nacl[*].tags : null
}

#### DEFAULT PUBLIC SUBNET NACL ####

output "default_public_subnet_nacl_id" {
  value = length(module.default_public_subnet_nacl) > 0 ? module.default_public_subnet_nacl[*].id : null
}

output "default_public_subnet_nacl_arn" {
  value = length(module.default_public_subnet_nacl) > 0 ? module.default_public_subnet_nacl[*].arn : null
}

output "default_public_subnet_nacl_tags" {
  value = length(module.default_public_subnet_nacl) > 0 ? module.default_public_subnet_nacl[*].tags : null
}

#### DEFAULT PRIVATE SUBNET NACL ###

output "default_private_subnet_nacl_id" {
  value = length(module.default_private_subnet_nacl) > 0 ? module.default_private_subnet_nacl[*].id : null
}

output "default_private_subnet_nacl_arn" {
  value = length(module.default_private_subnet_nacl) > 0 ? module.default_private_subnet_nacl[*].arn : null
}

output "default_private_subnet_nacl_tags" {
  value = length(module.default_private_subnet_nacl) > 0 ? module.default_private_subnet_nacl[*].tags : null
}

### DEFAULT PROTECTED SUBNET NACL ##

output "default_protected_subnet_nacl_id" {
  value = length(module.default_protected_subnet_nacl) > 0 ? module.default_protected_subnet_nacl[*].id : null
}

output "default_protected_subnet_nacl_arn" {
  value = length(module.default_protected_subnet_nacl) > 0 ? module.default_protected_subnet_nacl[*].arn : null
}

output "default_protected_subnet_nacl_tags" {
  value = length(module.default_protected_subnet_nacl) > 0 ? module.default_protected_subnet_nacl[*].tags : null
}

######## PUBLIC SUBNET NACL ########

output "public_subnet_nacl_id" {
  value = length(module.public_subnet_nacl) > 0 ? module.public_subnet_nacl[*].id : null
}

output "public_subnet_nacl_arn" {
  value = length(module.public_subnet_nacl) > 0 ? module.public_subnet_nacl[*].arn : null
}

output "public_subnet_nacl_tags" {
  value = length(module.public_subnet_nacl) > 0 ? module.public_subnet_nacl[*].tags : null
}

######## PRIVATE SUBNET NACL #######

output "private_subnet_nacl_id" {
  value = length(module.private_subnet_nacl) > 0 ? module.private_subnet_nacl[*].id : null
}

output "private_subnet_nacl_arn" {
  value = length(module.private_subnet_nacl) > 0 ? module.private_subnet_nacl[*].arn : null
}

output "private_subnet_nacl_tags" {
  value = length(module.private_subnet_nacl) > 0 ? module.private_subnet_nacl[*].tags : null
}

####### PROTECTED SUBNET NACL ######

output "protected_subnet_nacl_id" {
  value = length(module.protected_subnet_nacl) > 0 ? module.protected_subnet_nacl[*].id : null
}

output "protected_subnet_nacl_arn" {
  value = length(module.protected_subnet_nacl) > 0 ? module.protected_subnet_nacl[*].arn : null
}

output "protected_subnet_nacl_tags" {
  value = length(module.protected_subnet_nacl) > 0 ? module.protected_subnet_nacl[*].tags : null
}

