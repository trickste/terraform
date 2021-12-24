##### IGW GATEWAY ROUTE #####
output "internet_gateway_route_id" {
  value = var.create_internet_gateway_route != null ? aws_route.internet_gateway_route[*].id : null
}

output "internet_gateway_route_origin" {
  value = var.create_internet_gateway_route != null ? aws_route.internet_gateway_route[*].origin : null
}

output "internet_gateway_route_state" {
  value = var.create_internet_gateway_route != null ? aws_route.internet_gateway_route[*].state : null
}

##### NAT GATEWAY ROUTE #####
output "nat_gateway_route_id" {
  value = var.create_nat_gateway_route != null ? aws_route.nat_gateway_route[*].id : null
}

output "nat_gateway_route_origin" {
  value = var.create_nat_gateway_route != null ? aws_route.nat_gateway_route[*].origin : null
}

output "nat_gateway_route_state" {
  value = var.create_nat_gateway_route != null ? aws_route.nat_gateway_route[*].state : null
}

##### VPC ENDPOINT ROUTE #####
output "vpc_endpoint_route_id" {
  value = var.create_vpc_endpoint_route != null ? aws_route.vpc_endpoint_route[*].id : null
}

output "vpc_endpoint_route_origin" {
  value = var.create_vpc_endpoint_route != null ? aws_route.vpc_endpoint_route[*].origin : null
}

output "vpc_endpoint_route_state" {
  value = var.create_vpc_endpoint_route != null ? aws_route.vpc_endpoint_route[*].state : null
}

##### VPC PEERING ROUTE #####
output "vpc_peering_route_id" {
  value = var.create_vpc_peering_route != null ? aws_route.vpc_peering_route[*].id : null
}

output "vpc_peering_route_origin" {
  value = var.create_vpc_peering_route != null ? aws_route.vpc_peering_route[*].origin : null
}

output "vpc_peering_route_state" {
  value = var.create_vpc_peering_route != null ? aws_route.vpc_peering_route[*].state : null
}

##### INSTANCE ROUTE #####
output "instance_route_id" {
  value = var.create_instance_route != null ? aws_route.instance_route[*].id : null
}

output "instance_route_origin" {
  value = var.create_instance_route != null ? aws_route.instance_route[*].origin : null
}

output "instance_route_state" {
  value = var.create_instance_route != null ? aws_route.instance_route[*].state : null
}