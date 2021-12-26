locals {
  subnet_index_with_nat = compact([for index in range(length(var.public_subnet)) :
    var.public_subnet[index].create_nat == true ? tostring(index) : ""
  ])

  default_nacl_default_config = {
    name = "default_nacl"
    nacl_ingress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    nacl_egress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    tags = null
  }

  default_public_subnet_nacl_default_config = {
    name = "default_public_subnet"
    nacl_ingress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    nacl_egress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    tags = null
  }

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
    nacl_ingress                    = null
    nacl_egress                     = null
    tags                            = null
    route_table_tags                = null
    eip_tags                        = null
    nat_tags                        = null
    nacl_tags                       = null
  }

  default_private_subnet_nacl_default_config = {
    name = "default_private_subnet"
    nacl_ingress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    nacl_egress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    tags = null
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
    nacl_ingress                    = null
    nacl_egress                     = null
    tags                            = null
    route_table_tags                = null
    nacl_tags                       = null
  }

  default_protected_subnet_nacl_default_config = {
    name = "default_protected_subnet"
    nacl_ingress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    nacl_egress = [
      {
        rule_number     = 200
        egress          = false
        protocol        = "tcp"
        rule_action     = "allow"
        cidr_block      = "0.0.0.0/0"
        from_port       = 22
        to_port         = 22
        icmp_code       = -1
        icmp_type       = -1
      }
    ]
    tags = null
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
    nacl_ingress                    = null
    nacl_egress                     = null
    tags                            = null
    route_table_tags                = null
    nacl_tags                       = null
  }
}