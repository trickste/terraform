resource "aws_vpc" "vpc" {
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
  count = var.create_igw ? 1 : 0
  source = "../igw"
  name   = "${var.name}-igw"
  vpc_id = aws_vpc.vpc.id
  tags   = var.tags
}