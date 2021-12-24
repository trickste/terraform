resource "aws_route" "internet_gateway_route" {
  count                       = var.create_internet_gateway_route ? 1 : 0
  route_table_id              = var.route_table_id
  destination_cidr_block      = var.destination_ipv6_cidr_block == null ? var.destination_cidr_block : null
  destination_ipv6_cidr_block = var.destination_ipv6_cidr_block != null ? var.destination_ipv6_cidr_block : null
  gateway_id                  = var.gateway_id
}

resource "aws_route" "nat_gateway_route" {
  count                       = var.create_nat_gateway_route ? 1 : 0
  route_table_id              = var.route_table_id
  destination_cidr_block      = var.destination_ipv6_cidr_block == null ? var.destination_cidr_block : null
  destination_ipv6_cidr_block = var.destination_ipv6_cidr_block != null ? var.destination_ipv6_cidr_block : null
  nat_gateway_id              = var.nat_gateway_id
}


resource "aws_route" "vpc_endpoint_route" {
  count                       = var.create_vpc_endpoint_route ? 1 : 0
  route_table_id              = var.route_table_id
  destination_cidr_block      = var.destination_ipv6_cidr_block == null ? var.destination_cidr_block : null
  destination_ipv6_cidr_block = var.destination_ipv6_cidr_block != null ? var.destination_ipv6_cidr_block : null
  vpc_endpoint_id             = var.vpc_endpoint_id
}

resource "aws_route" "vpc_peering_route" {
  count                       = var.create_vpc_peering_route ? 1 : 0
  route_table_id              = var.route_table_id
  destination_cidr_block      = var.destination_ipv6_cidr_block == null ? var.destination_cidr_block : null
  destination_ipv6_cidr_block = var.destination_ipv6_cidr_block != null ? var.destination_ipv6_cidr_block : null
  vpc_peering_connection_id   = var.vpc_peering_connection_id
}

resource "aws_route" "instance_route" {
  count                       = var.create_instance_route ? 1 : 0
  route_table_id              = var.route_table_id
  destination_cidr_block      = var.destination_ipv6_cidr_block == null ? var.destination_cidr_block : null
  destination_ipv6_cidr_block = var.destination_ipv6_cidr_block != null ? var.destination_ipv6_cidr_block : null
  instance_id                 = var.instance_id
}