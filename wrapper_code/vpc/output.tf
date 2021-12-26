output "arn" {
  value = module.vpc.arn
}

output "id" {
  value = module.vpc.id
}

output "cidr_block" {
  value = module.vpc.cidr_block
}

output "instance_tenancy" {
  value = module.vpc.instance_tenancy
}

output "enable_dns_support" {
  value = module.vpc.enable_dns_support
}

output "enable_dns_hostnames" {
  value = module.vpc.enable_dns_hostnames
}

output "main_route_table_id" {
  value = module.vpc.main_route_table_id
}

output "owner_id" {
  value = module.vpc.owner_id
}

output "tags" {
  value = module.vpc.tags
}

############## IGW ##############

output "igw_id" {
  value = var.create_igw ? module.vpc.igw_id : null
}

output "igw_arn" {
  value = var.create_igw ? module.vpc.arn : null
}

output "igw_owner_id" {
  value = var.create_igw ? module.vpc.owner_id : null
}

output "igw_tags" {
  value = var.create_igw ? module.vpc.igw_tags : null
}

######### PUBLIC SUBNET #########

output "public_subnet_ids" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_subnet_ids : null
}

output "public_subnet_arns" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_subnet_arns : null
}

output "public_subnet_tags" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_subnet_tags : null
}

output "public_subnet_cidr" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_subnet_cidr : null
}

#### PUBLIC SUBNET ROUTE TABLE ####

output "public_route_table_ids" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_route_table_ids : null
}

output "public_route_table_arns" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_route_table_arns : null
}

output "public_route_table_tags" {
  value = length(var.public_subnet) > 0 ? module.vpc.public_route_table_tags : null
}

######### PRIVATE SUBNET #########

output "private_subnet_ids" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_subnet_ids : null
}

output "private_subnet_arns" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_subnet_arns : null
}

output "private_subnet_tags" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_subnet_tags : null
}

output "private_subnet_cidr" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_subnet_cidr : null
}

#### PRIVATE SUBNET ROUTE TABLE ###

output "private_route_table_ids" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_route_table_ids : null
}

output "private_route_table_arns" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_route_table_arns : null
}

output "private_route_table_tags" {
  value = length(var.private_subnet) > 0 ? module.vpc.private_route_table_tags : null
}

######### PROTECTED SUBNET ########

output "protected_subnet_ids" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_subnet_ids : null
}

output "protected_subnet_arns" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_subnet_arns : null
}

output "protected_subnet_tags" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_subnet_tags : null
}

output "protected_subnet_cidr" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_subnet_cidr : null
}

### PROTECTED SUBNET ROUTE TABLE ##

output "protected_route_table_ids" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_route_table_ids : null
}

output "protected_route_table_arns" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_route_table_arns : null
}

output "protected_route_table_tags" {
  value = length(var.protected_subnet) > 0 ? module.vpc.protected_route_table_tags : null
}

# output "test-for-script-default_nacl" {
#   value = jsondecode(replace(module.vpc.data_external_result.default_nacl, "'", "\""))
# }

# output "test-for-script-default_public_subnet_nacl" {
#   value = jsondecode(replace(module.vpc.data_external_result.default_public_subnet_nacl, "'", "\""))
# }

# output "test-for-script-default_private_subnet_nacl" {
#   value = jsondecode(replace(module.vpc.data_external_result.default_private_subnet_nacl, "'", "\""))
# }

########### DEFAULT NACL ##########

output "default_nacl_id" {
  value = module.vpc.default_nacl_id
}

output "default_nacl_arn" {
  value = module.vpc.default_nacl_arn
}

output "default_nacl_tags" {
  value = module.vpc.default_nacl_tags
}

#### DEFAULT PUBLIC SUBNET NACL ####

output "default_public_subnet_nacl_id" {
  value = module.vpc.default_public_subnet_nacl_id
}

output "default_public_subnet_nacl_arn" {
  value = module.vpc.default_public_subnet_nacl_arn
}

output "default_public_subnet_nacl_tags" {
  value = module.vpc.default_public_subnet_nacl_tags
}

#### DEFAULT PRIVATE SUBNET NACL ###

output "default_private_subnet_nacl_id" {
  value = module.vpc.default_private_subnet_nacl_id
}

output "default_private_subnet_nacl_arn" {
  value = module.vpc.default_private_subnet_nacl_arn
}

output "default_private_subnet_nacl_tags" {
  value = module.vpc.default_private_subnet_nacl_tags
}

### DEFAULT PROTECTED SUBNET NACL ##

output "default_protected_subnet_nacl_id" {
  value = module.vpc.default_protected_subnet_nacl_id
}

output "default_protected_subnet_nacl_arn" {
  value = module.vpc.default_protected_subnet_nacl_arn
}

output "default_protected_subnet_nacl_tags" {
  value = module.vpc.default_protected_subnet_nacl_tags
}

######## PUBLIC SUBNET NACL ########

output "public_subnet_nacl_id" {
  value = module.vpc.public_subnet_nacl_id
}

output "public_subnet_nacl_arn" {
  value = module.vpc.public_subnet_nacl_arn
}

output "public_subnet_nacl_tags" {
  value = module.vpc.public_subnet_nacl_tags
}

######## PRIVATE SUBNET NACL #######

output "private_subnet_nacl_id" {
  value = module.vpc.private_subnet_nacl_id
}

output "private_subnet_nacl_arn" {
  value = module.vpc.private_subnet_nacl_arn
}

output "private_subnet_nacl_tags" {
  value = module.vpc.private_subnet_nacl_tags
}

####### PROTECTED SUBNET NACL ######

output "protected_subnet_nacl_id" {
  value = module.vpc.protected_subnet_nacl_id
}

output "protected_subnet_nacl_arn" {
  value = module.vpc.protected_subnet_nacl_arn
}

output "protected_subnet_nacl_tags" {
  value = module.vpc.protected_subnet_nacl_tags
}