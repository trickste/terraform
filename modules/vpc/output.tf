output "arn" {
  value = aws_vpc.vpc.arn
}

output "id" {
  value = aws_vpc.vpc.id
}

output "cidr_block" {
  value = resource.aws_vpc.vpc.cidr_block
}

output "instance_tenancy" {
  value = resource.aws_vpc.vpc.instance_tenancy
}

output "enable_dns_support" {
  value = aws_vpc.vpc.enable_dns_support
}

output "enable_dns_hostnames" {
  value = aws_vpc.vpc.enable_dns_hostnames
}

output "main_route_table_id" {
  value = aws_vpc.vpc.main_route_table_id
}

output "owner_id" {
  value = aws_vpc.vpc.owner_id
}

output "tags" {
  value = aws_vpc.vpc.tags_all
}

############## IGW ##############

output "igw_id" {
  value = var.create_igw ? module.igw : null
}

# output "igw_arn" {
#   value = var.create_igw ? module.igw.arn : null
# }

# output "igw_owner_id" {
#   value = var.create_igw ? module.igw.owner_id : null
# }

# output "igw_tags" {
#   value = var.create_igw ? module.igw.tags_all : null
# }