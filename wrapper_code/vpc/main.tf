module "vpc" {
  source                                        = "../../modules/vpc"
  create_igw                                    = var.create_igw
  public_subnet_name                            = var.public_subnet_name
  public_subnet                                 = var.public_subnet
  private_subnet                                = var.private_subnet
  protected_subnet                              = var.protected_subnet
  assign_ipv6_address_on_creation               = var.assign_ipv6_address_on_creation
  public_subnet_assign_ipv6_address_on_creation = var.public_subnet_assign_ipv6_address_on_creation
}