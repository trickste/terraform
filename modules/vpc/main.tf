resource "aws_vpc" "vpc" {
  count                            = var.create_vpc ? 1 : 0
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

############## IGW ##############

module "igw" {
  count  = length(var.public_subnet) > 0 || var.create_igw ? 1 : 0
  source = "../igw"
  name   = "${var.name}-igw"
  vpc_id = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  tags   = var.igw_tags != null ? var.igw_tags : var.tags
}

######### PUBLIC SUBNET #########

module "public_subnet" {
  count                           = length(var.public_subnet)
  source                          = "../subnet"
  name                            = lookup(var.public_subnet[count.index], "name", null) != null ? format("%s-%s-%s", var.name, lookup(var.public_subnet[count.index], "name", null), reverse(split("", lookup(var.public_subnet[count.index], "availability_zone", null)))[0]) : format("%s-%s-%s", var.name, var.public_subnet_name, reverse(split("", lookup(var.public_subnet[count.index], "availability_zone", null)))[0])
  vpc_id                          = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  cidr_block                      = lookup(var.public_subnet[count.index], "cidr_block", null)
  availability_zone               = lookup(var.public_subnet[count.index], "availability_zone", null)
  assign_ipv6_address_on_creation = lookup(var.public_subnet[count.index], "assign_ipv6_address_on_creation", null) != null ? lookup(var.public_subnet[count.index], "assign_ipv6_address_on_creation", null) : (var.public_subnet_assign_ipv6_address_on_creation != null ? var.public_subnet_assign_ipv6_address_on_creation : var.assign_ipv6_address_on_creation)
  map_customer_owned_ip_on_launch = lookup(var.public_subnet[count.index], "map_customer_owned_ip_on_launch", null)
  customer_owned_ipv4_pool        = lookup(var.public_subnet[count.index], "customer_owned_ipv4_pool", null)
  outpost_arn                     = lookup(var.public_subnet[count.index], "outpost_arn", null)
  ipv6_cidr_block                 = lookup(var.public_subnet[count.index], "ipv6_cidr_block", null)
  tags                            = lookup(var.public_subnet[count.index], "tags", null) != null ? lookup(var.public_subnet[count.index], "tags") : (var.public_subnet_tags != null ? var.public_subnet_tags : var.tags)
}

######### PRIVATE SUBNET ########

module "private_subnet" {
  count                           = length(var.private_subnet)
  source                          = "../subnet"
  name                            = lookup(var.private_subnet[count.index], "name", null) != null ? format("%s-%s-%s", var.name, lookup(var.private_subnet[count.index], "name", null), reverse(split("", lookup(var.private_subnet[count.index], "availability_zone", null)))[0]) : format("%s-%s-%s", var.name, var.private_subnet_name, reverse(split("", lookup(var.private_subnet[count.index], "availability_zone", null)))[0])
  vpc_id                          = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  cidr_block                      = lookup(var.private_subnet[count.index], "cidr_block", null)
  availability_zone               = lookup(var.private_subnet[count.index], "availability_zone", null)
  assign_ipv6_address_on_creation = lookup(var.private_subnet[count.index], "assign_ipv6_address_on_creation", null) != null ? lookup(var.private_subnet[count.index], "assign_ipv6_address_on_creation", null) : (var.private_subnet_assign_ipv6_address_on_creation != null ? var.private_subnet_assign_ipv6_address_on_creation : var.assign_ipv6_address_on_creation)
  map_customer_owned_ip_on_launch = lookup(var.private_subnet[count.index], "map_customer_owned_ip_on_launch", null)
  customer_owned_ipv4_pool        = lookup(var.private_subnet[count.index], "customer_owned_ipv4_pool", null)
  outpost_arn                     = lookup(var.private_subnet[count.index], "outpost_arn", null)
  ipv6_cidr_block                 = lookup(var.private_subnet[count.index], "ipv6_cidr_block", null)
  tags                            = lookup(var.private_subnet[count.index], "tags", null) != null ? lookup(var.private_subnet[count.index], "tags") : (var.private_subnet_tags != null ? var.private_subnet_tags : var.tags)
}

######### PROTECTED SUBNET ########

module "protected_subnet" {
  count                           = length(var.protected_subnet)
  source                          = "../subnet"
  name                            = lookup(var.protected_subnet[count.index], "name", null) != null ? format("%s-%s-%s", var.name, lookup(var.protected_subnet[count.index], "name", null), reverse(split("", lookup(var.protected_subnet[count.index], "availability_zone", null)))[0]) : format("%s-%s-%s", var.name, var.protected_subnet_name, reverse(split("", lookup(var.protected_subnet[count.index], "availability_zone", null)))[0])
  vpc_id                          = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  cidr_block                      = lookup(var.protected_subnet[count.index], "cidr_block", null)
  availability_zone               = lookup(var.protected_subnet[count.index], "availability_zone", null)
  assign_ipv6_address_on_creation = lookup(var.protected_subnet[count.index], "assign_ipv6_address_on_creation", null) != null ? lookup(var.protected_subnet[count.index], "assign_ipv6_address_on_creation", null) : (var.protected_subnet_assign_ipv6_address_on_creation != null ? var.protected_subnet_assign_ipv6_address_on_creation : var.assign_ipv6_address_on_creation)
  map_customer_owned_ip_on_launch = lookup(var.protected_subnet[count.index], "map_customer_owned_ip_on_launch", null)
  customer_owned_ipv4_pool        = lookup(var.protected_subnet[count.index], "customer_owned_ipv4_pool", null)
  outpost_arn                     = lookup(var.protected_subnet[count.index], "outpost_arn", null)
  ipv6_cidr_block                 = lookup(var.protected_subnet[count.index], "ipv6_cidr_block", null)
  tags                            = lookup(var.protected_subnet[count.index], "tags", null) != null ? lookup(var.protected_subnet[count.index], "tags") : (var.protected_subnet_tags != null ? var.protected_subnet_tags : var.tags)
}