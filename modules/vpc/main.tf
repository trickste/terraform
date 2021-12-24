############## VPC ##############

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
  count  = (length(var.public_subnet) > 0 || var.create_igw) && (var.igw_id == null) ? 1 : 0
  source = "../igw"
  name   = "${var.name}-igw"
  vpc_id = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  tags   = var.igw_tags != null ? var.igw_tags : var.tags
}


######### PUBLIC SUBNET #########

module "public_subnet" {
  count                           = length(var.public_subnet)
  source                          = "../subnet"
  name                            = lookup(var.public_subnet[count.index], "name", local.default_public_subnet_config.name) != null ? format("%s-%s-%s", var.name, lookup(var.public_subnet[count.index], "name", local.default_public_subnet_config.name), reverse(split("", lookup(var.public_subnet[count.index], "availability_zone", local.default_public_subnet_config.availability_zone)))[0]) : format("%s-%s-%s", var.name, var.public_subnet_name, reverse(split("", lookup(var.public_subnet[count.index], "availability_zone", local.default_public_subnet_config.availability_zone)))[0])
  vpc_id                          = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  cidr_block                      = lookup(var.public_subnet[count.index], "cidr_block", local.default_public_subnet_config.cidr_block)
  availability_zone               = lookup(var.public_subnet[count.index], "availability_zone", local.default_public_subnet_config.availability_zone)
  assign_ipv6_address_on_creation = lookup(var.public_subnet[count.index], "assign_ipv6_address_on_creation", local.default_public_subnet_config.assign_ipv6_address_on_creation) != null ? lookup(var.public_subnet[count.index], "assign_ipv6_address_on_creation", local.default_public_subnet_config.assign_ipv6_address_on_creation) : (var.public_subnet_assign_ipv6_address_on_creation != null ? var.public_subnet_assign_ipv6_address_on_creation : var.assign_ipv6_address_on_creation)
  map_customer_owned_ip_on_launch = lookup(var.public_subnet[count.index], "map_customer_owned_ip_on_launch", local.default_public_subnet_config.map_customer_owned_ip_on_launch)
  customer_owned_ipv4_pool        = lookup(var.public_subnet[count.index], "customer_owned_ipv4_pool", local.default_public_subnet_config.customer_owned_ipv4_pool)
  outpost_arn                     = lookup(var.public_subnet[count.index], "outpost_arn", local.default_public_subnet_config.outpost_arn)
  ipv6_cidr_block                 = lookup(var.public_subnet[count.index], "ipv6_cidr_block", local.default_public_subnet_config.ipv6_cidr_block)
  tags                            = lookup(var.public_subnet[count.index], "tags", local.default_public_subnet_config.tags) != null ? lookup(var.public_subnet[count.index], "tags") : (var.public_subnet_tags != null ? var.public_subnet_tags : var.tags)
}

###### PUBLIC ROUTE TABLES #####

module "public_route_table" {
  count     = length(var.public_subnet)
  source    = "../route-table"
  vpc_id    = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  subnet_id = module.public_subnet[count.index].id
  name      = lookup(var.public_subnet[count.index], "name", local.default_public_subnet_config.name) != null ? format("%s-%s-%s-rt", var.name, lookup(var.public_subnet[count.index], "name", local.default_public_subnet_config.name), reverse(split("", lookup(var.public_subnet[count.index], "availability_zone", local.default_public_subnet_config.availability_zone)))[0]) : format("%s-%s-%s-rt", var.name, var.public_subnet_name, reverse(split("", lookup(var.public_subnet[count.index], "availability_zone", local.default_public_subnet_config.availability_zone)))[0])
  tags      = lookup(var.public_subnet[count.index], "route_table_tags", local.default_public_subnet_config.route_table_tags) != null ? lookup(var.public_subnet[count.index], "route_table_tags", local.default_public_subnet_config.route_table_tags) : (lookup(var.public_subnet[count.index], "tags", local.default_public_subnet_config.tags) != null ? lookup(var.public_subnet[count.index], "tags") : (var.public_subnet_tags != null ? var.public_subnet_tags : var.tags))
  depends_on = [
    module.public_subnet
  ]
}

####### IGW PUBLIC ROUTE ######

module "public_routes_igw" {
  count                         = var.igw_id != null || (var.create_igw && length(module.public_route_table) > 0) ? length(module.public_route_table) : 0
  source                        = "../route"
  create_internet_gateway_route = lookup(var.public_subnet[count.index], "create_internet_gateway_route", local.default_public_subnet_config.create_internet_gateway_route)
  route_table_id                = module.public_route_table[count.index].id
  destination_cidr_block        = lookup(var.public_subnet[count.index], "igw_destination_cidr_block", local.default_public_subnet_config.igw_destination_cidr_block)
  gateway_id                    = var.igw_id != null ? var.igw_id : module.igw[0].id
  depends_on = [
    module.igw,
    module.public_route_table
  ]
}

######### PRIVATE SUBNET ########

module "private_subnet" {
  count                           = length(var.private_subnet)
  source                          = "../subnet"
  name                            = lookup(var.private_subnet[count.index], "name", local.default_private_subnet_config.name) != null ? format("%s-%s-%s", var.name, lookup(var.private_subnet[count.index], "name", local.default_private_subnet_config.name), reverse(split("", lookup(var.private_subnet[count.index], "availability_zone", local.default_private_subnet_config.availability_zone)))[0]) : format("%s-%s-%s", var.name, var.private_subnet_name, reverse(split("", lookup(var.private_subnet[count.index], "availability_zone", local.default_private_subnet_config.availability_zone)))[0])
  vpc_id                          = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  cidr_block                      = lookup(var.private_subnet[count.index], "cidr_block", local.default_private_subnet_config.cidr_block)
  availability_zone               = lookup(var.private_subnet[count.index], "availability_zone", local.default_private_subnet_config.availability_zone)
  assign_ipv6_address_on_creation = lookup(var.private_subnet[count.index], "assign_ipv6_address_on_creation", local.default_private_subnet_config.assign_ipv6_address_on_creation) != null ? lookup(var.private_subnet[count.index], "assign_ipv6_address_on_creation", local.default_private_subnet_config.assign_ipv6_address_on_creation) : (var.private_subnet_assign_ipv6_address_on_creation != null ? var.private_subnet_assign_ipv6_address_on_creation : var.assign_ipv6_address_on_creation)
  map_customer_owned_ip_on_launch = lookup(var.private_subnet[count.index], "map_customer_owned_ip_on_launch", local.default_private_subnet_config.map_customer_owned_ip_on_launch)
  customer_owned_ipv4_pool        = lookup(var.private_subnet[count.index], "customer_owned_ipv4_pool", local.default_private_subnet_config.customer_owned_ipv4_pool)
  outpost_arn                     = lookup(var.private_subnet[count.index], "outpost_arn", local.default_private_subnet_config.outpost_arn)
  ipv6_cidr_block                 = lookup(var.private_subnet[count.index], "ipv6_cidr_block", local.default_private_subnet_config.ipv6_cidr_block)
  tags                            = lookup(var.private_subnet[count.index], "tags", local.default_private_subnet_config.tags) != null ? lookup(var.private_subnet[count.index], "tags") : (var.private_subnet_tags != null ? var.private_subnet_tags : var.tags)
}

######### NAT GATEWAY ##########

module "nat" {
  count             = length(var.nat_ids) == 0 && length(var.private_subnet) > 0 ? (length(local.subnet_index_with_nat) > 0 ? length(local.subnet_index_with_nat) : 1) : 0
  source            = "../nat"
  eip_vpc           = lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "eip_vpc", local.default_public_subnet_config.eip_vpc)
  eip_name          = lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "name", local.default_public_subnet_config.name) != null ? format("%s-%s-%s-eip", var.name, lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "name", local.default_public_subnet_config.name), reverse(split("", lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "availability_zone", local.default_public_subnet_config.availability_zone)))[0]) : format("%s-%s-%s-eip", var.name, var.public_subnet_name, reverse(split("", lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "availability_zone", local.default_public_subnet_config.availability_zone)))[0])
  eip_tags          = lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "eip_tags", local.default_public_subnet_config.eip_tags) != null ? lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "eip_tags", local.default_public_subnet_config.eip_tags) : (lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "nat_tags", local.default_public_subnet_config.nat_tags) != null ? lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "nat_tags", local.default_public_subnet_config.nat_tags) : (lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "tags", local.default_public_subnet_config.tags) != null ? lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "tags") : (var.public_subnet_tags != null ? var.public_subnet_tags : var.tags)))
  connectivity_type = lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "nat_connectivity_type", local.default_public_subnet_config.nat_connectivity_type)
  subnet_id         = element(module.public_subnet, tonumber(local.subnet_index_with_nat[count.index])).id
  name              = lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "name", local.default_public_subnet_config.name) != null ? format("%s-%s-%s-nat", var.name, lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "name", local.default_public_subnet_config.name), reverse(split("", lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "availability_zone", local.default_public_subnet_config.availability_zone)))[0]) : format("%s-%s-%s-nat", var.name, var.public_subnet_name, reverse(split("", lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "availability_zone", local.default_public_subnet_config.availability_zone)))[0])
  tags              = lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "nat_tags", local.default_public_subnet_config.nat_tags) != null ? lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "nat_tags", local.default_public_subnet_config.nat_tags) : (lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "tags", local.default_public_subnet_config.tags) != null ? lookup(element(var.public_subnet, tonumber(local.subnet_index_with_nat[count.index])), "tags") : (var.public_subnet_tags != null ? var.public_subnet_tags : var.tags))
  depends_on = [
    module.private_subnet
  ]
}

###### PRIVATE ROUTE TABLES #####

module "private_route_table" {
  count  = length(var.private_subnet)
  source = "../route-table"
  vpc_id = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  name   = lookup(var.private_subnet[count.index], "name", local.default_private_subnet_config.name) != null ? format("%s-%s-%s-rt", var.name, lookup(var.private_subnet[count.index], "name", local.default_private_subnet_config.name), reverse(split("", lookup(var.private_subnet[count.index], "availability_zone", local.default_private_subnet_config.availability_zone)))[0]) : format("%s-%s-%s-rt", var.name, var.private_subnet_name, reverse(split("", lookup(var.private_subnet[count.index], "availability_zone", local.default_private_subnet_config.availability_zone)))[0])
  tags   = lookup(var.private_subnet[count.index], "route_table_tags", local.default_private_subnet_config.route_table_tags) != null ? lookup(var.private_subnet[count.index], "route_table_tags", local.default_private_subnet_config.route_table_tags) : (lookup(var.private_subnet[count.index], "tags", local.default_private_subnet_config.tags) != null ? lookup(var.private_subnet[count.index], "tags") : (var.private_subnet_tags != null ? var.private_subnet_tags : var.tags))
}

####### NAT PRIVATE ROUTE ######

module "private_routes_nat" {
  count                    = (length(module.nat) > 0 || length(var.nat_ids) > 0) && (length(var.private_subnet) > 0 && length(module.private_route_table) > 0) ? length(module.private_route_table) : 0
  source                   = "../route"
  create_nat_gateway_route = lookup(var.private_subnet[count.index], "create_nat_gateway_route", local.default_private_subnet_config.create_nat_gateway_route)
  route_table_id           = module.private_route_table[count.index].id
  destination_cidr_block   = lookup(var.private_subnet[count.index], "nat_destination_cidr_block", local.default_private_subnet_config.nat_destination_cidr_block)
  nat_gateway_id           = length(var.nat_ids) > 0 ? element(var.nat_ids, count.index) : lookup(element(module.nat, count.index), "id")
  depends_on = [
    module.private_route_table
  ]
}

######## PROTECTED SUBNET ########

module "protected_subnet" {
  count                           = length(var.protected_subnet)
  source                          = "../subnet"
  name                            = lookup(var.protected_subnet[count.index], "name", local.default_protected_subnet_config.name) != null ? format("%s-%s-%s", var.name, lookup(var.protected_subnet[count.index], "name", local.default_protected_subnet_config.name), reverse(split("", lookup(var.protected_subnet[count.index], "availability_zone", local.default_protected_subnet_config.availability_zone)))[0]) : format("%s-%s-%s", var.name, var.protected_subnet_name, reverse(split("", lookup(var.protected_subnet[count.index], "availability_zone", local.default_protected_subnet_config.availability_zone)))[0])
  vpc_id                          = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  cidr_block                      = lookup(var.protected_subnet[count.index], "cidr_block", local.default_protected_subnet_config.cidr_block)
  availability_zone               = lookup(var.protected_subnet[count.index], "availability_zone", local.default_protected_subnet_config.availability_zone)
  assign_ipv6_address_on_creation = lookup(var.protected_subnet[count.index], "assign_ipv6_address_on_creation", local.default_protected_subnet_config.assign_ipv6_address_on_creation) != null ? lookup(var.protected_subnet[count.index], "assign_ipv6_address_on_creation", local.default_protected_subnet_config.assign_ipv6_address_on_creation) : (var.protected_subnet_assign_ipv6_address_on_creation != null ? var.protected_subnet_assign_ipv6_address_on_creation : var.assign_ipv6_address_on_creation)
  map_customer_owned_ip_on_launch = lookup(var.protected_subnet[count.index], "map_customer_owned_ip_on_launch", local.default_protected_subnet_config.map_customer_owned_ip_on_launch)
  customer_owned_ipv4_pool        = lookup(var.protected_subnet[count.index], "customer_owned_ipv4_pool", local.default_protected_subnet_config.customer_owned_ipv4_pool)
  outpost_arn                     = lookup(var.protected_subnet[count.index], "outpost_arn", local.default_protected_subnet_config.outpost_arn)
  ipv6_cidr_block                 = lookup(var.protected_subnet[count.index], "ipv6_cidr_block", local.default_protected_subnet_config.ipv6_cidr_block)
  tags                            = lookup(var.protected_subnet[count.index], "tags", local.default_protected_subnet_config.tags) != null ? lookup(var.protected_subnet[count.index], "tags") : (var.protected_subnet_tags != null ? var.protected_subnet_tags : var.tags)
}

##### PROTECTED ROUTE TABLES ####

module "protected_route_table" {
  count  = length(var.protected_subnet)
  source = "../route-table"
  vpc_id = var.create_vpc ? aws_vpc.vpc[0].id : var.vpc_id
  name   = lookup(var.protected_subnet[count.index], "name", local.default_protected_subnet_config.name) != null ? format("%s-%s-%s-rt", var.name, lookup(var.protected_subnet[count.index], "name", local.default_protected_subnet_config.name), reverse(split("", lookup(var.protected_subnet[count.index], "availability_zone", local.default_protected_subnet_config.availability_zone)))[0]) : format("%s-%s-%s-rt", var.name, var.protected_subnet_name, reverse(split("", lookup(var.protected_subnet[count.index], "availability_zone", local.default_protected_subnet_config.availability_zone)))[0])
  tags   = lookup(var.protected_subnet[count.index], "route_table_tags", local.default_protected_subnet_config.route_table_tags) != null ? lookup(var.protected_subnet[count.index], "route_table_tags", local.default_protected_subnet_config.route_table_tags) : (lookup(var.protected_subnet[count.index], "tags", local.default_protected_subnet_config.tags) != null ? lookup(var.protected_subnet[count.index], "tags") : (var.protected_subnet_tags != null ? var.protected_subnet_tags : var.tags))
}

###### NAT PROTECTED ROUTE #####

module "protected_routes_nat" {
  count                    = (length(module.nat) > 0 || length(module.nat) > 0) && (length(var.protected_subnet) > 0 && length(module.protected_route_table) > 0) ? length(module.protected_route_table) : 0
  source                   = "../route"
  create_nat_gateway_route = lookup(var.protected_subnet[count.index], "create_nat_gateway_route", local.default_protected_subnet_config.create_nat_gateway_route)
  route_table_id           = module.private_route_table[count.index].id
  destination_cidr_block   = length(var.nat_ids) > 0 ? element(var.nat_ids, count.index) : lookup(var.protected_subnet[count.index], "nat_destination_cidr_block", local.default_protected_subnet_config.nat_destination_cidr_block)
  nat_gateway_id           = lookup(element(module.nat, count.index), "id")
  depends_on = [
    module.protected_route_table
  ]
}