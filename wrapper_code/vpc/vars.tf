variable "create_igw" {
  default = true
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "default config for subnets to assign ipv6 or not"
  default     = false
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "default config for public subnets to assign ipv6 or not"
  default     = false
}

variable "public_subnet" {
  default = [
    {
      cidr_block        = "10.0.0.0/24"
      availability_zone = "ap-south-1a"
      create_nat        = true
    },
    {
      cidr_block                      = "10.0.1.0/24"
      availability_zone               = "ap-south-1b"
      name                            = "PUBLIC-SUBNET"
      create_nat                      = true
      assign_ipv6_address_on_creation = false
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
      tags = {
        region = "ap-south-1"
      }
      route_table_tags = {
        rt-specific = "yup"
      }
    }
  ]
}

variable "public_subnet_name" {
  type        = string
  description = "Common / Default name for public subnets"
  default     = "public-subnet"
}

variable "private_subnet" {
  default = [
    {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "ap-south-1a"
    },
    {
      cidr_block                      = "10.0.3.0/24"
      availability_zone               = "ap-south-1b"
      name                            = "PRIVATE-SUBNET"
      assign_ipv6_address_on_creation = false
    }
  ]
}

variable "protected_subnet" {
  default = [
    {
      cidr_block        = "10.0.4.0/24"
      availability_zone = "ap-south-1a"
    },
    {
      cidr_block                      = "10.0.5.0/24"
      availability_zone               = "ap-south-1b"
      name                            = "PROTECTED-SUBNET"
      assign_ipv6_address_on_creation = false
      create_nat_gateway_route        = true
    }
  ]
}