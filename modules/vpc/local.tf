locals {
  subnet_index_with_nat = compact([for index in range(length(var.public_subnet)) :
    var.public_subnet[index].create_nat == true ? tostring(index) : ""
  ])

  default_public_subnet_config = {
    name                            = null
    cidr_block                      = null
    availability_zone               = null
    assign_ipv6_address_on_creation = null
    map_customer_owned_ip_on_launch = null
    customer_owned_ipv4_pool        = null
    outpost_arn                     = null
    ipv6_cidr_block                 = null
    create_internet_gateway_route   = true
    igw_destination_cidr_block      = "0.0.0.0/0"
    eip_vpc                         = true
    nat_connectivity_type           = "public"
    tags                            = null
    route_table_tags                = null
    eip_tags                        = null
    nat_tags                        = null
  }

  default_private_subnet_config = {
    name                            = null
    cidr_block                      = null
    availability_zone               = null
    assign_ipv6_address_on_creation = null
    map_customer_owned_ip_on_launch = null
    customer_owned_ipv4_pool        = null
    outpost_arn                     = null
    ipv6_cidr_block                 = null
    create_nat_gateway_route        = true
    nat_destination_cidr_block      = "0.0.0.0/0"
    tags                            = null
    route_table_tags                = null
  }

  default_protected_subnet_config = {
    name                            = null
    cidr_block                      = null
    availability_zone               = null
    assign_ipv6_address_on_creation = null
    map_customer_owned_ip_on_launch = null
    customer_owned_ipv4_pool        = null
    outpost_arn                     = null
    ipv6_cidr_block                 = null
    create_nat_gateway_route        = false
    nat_destination_cidr_block      = "0.0.0.0/0"
    tags                            = null
    route_table_tags                = null
  }
}