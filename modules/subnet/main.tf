resource "aws_subnet" "subnet" {
  vpc_id                          = var.vpc_id
  cidr_block                      = var.cidr_block
  availability_zone               = var.availability_zone
  map_customer_owned_ip_on_launch = var.map_customer_owned_ip_on_launch
  customer_owned_ipv4_pool        = var.customer_owned_ipv4_pool
  outpost_arn                     = var.outpost_arn
  ipv6_cidr_block                 = var.ipv6_cidr_block
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}