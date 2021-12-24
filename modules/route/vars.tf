variable "route_table_id" {
  type        = string
  description = "Route Table ID"
  default     = null
}

variable "destination_cidr_block" {
  type        = string
  description = "destination ipv4 cidr block"
  default     = null
}

variable "destination_ipv6_cidr_block" {
  type        = string
  description = "destination ipv6 cidr block"
  default     = null
}

## IGW GATEWAY ##
variable "create_internet_gateway_route" {
  type        = bool
  description = "create internet gateway route"
  default     = false
}

variable "gateway_id" {
  type        = string
  description = "Identifier of a VPC internet gateway or a virtual private gateway"
  default     = null
}

## NAT GATEWAY ##
variable "create_nat_gateway_route" {
  type        = bool
  description = "create nat gateway route"
  default     = false
}

variable "nat_gateway_id" {
  type        = string
  description = "Identifier of a VPC NAT gateway"
  default     = ""
}


## VPC ENDPOINT ##
variable "create_vpc_endpoint_route" {
  type        = bool
  description = "create vpc endpoint route"
  default     = false
}

variable "vpc_endpoint_id" {
  type        = string
  description = "Identifier of a VPC Endpoint"
  default     = null
}

## VPC PEERING ##
variable "create_vpc_peering_route" {
  type        = bool
  description = "create vpc peering route"
  default     = false
}

variable "vpc_peering_connection_id" {
  type        = string
  description = "Identifier of a VPC peering connection"
  default     = null
}

## INSTANCE ROUTE ##
variable "create_instance_route" {
  type        = bool
  description = "create intance route"
  default     = false
}

variable "instance_id" {
  type        = string
  description = "Identifier of an EC2 instance"
  default     = null
}