module "vpc" {
  source             = "../../modules/vpc"
  create_igw         = var.create_igw
  public_subnet_name = var.public_subnet_name
  default_public_subnet_nacl = {
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
  }
  public_subnet                                 = var.public_subnet
  private_subnet                                = var.private_subnet
  protected_subnet                              = var.protected_subnet
  assign_ipv6_address_on_creation               = var.assign_ipv6_address_on_creation
  public_subnet_assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation
}