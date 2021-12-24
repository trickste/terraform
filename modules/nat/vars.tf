variable "connectivity_type" {
  type        = string
  description = "connectivity for nat gateway"
  default     = "public"
}

variable "create_nat" {
  type        = bool
  description = "Create NAT"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "The Subnet ID of the subnet in which to place the gateway"
}

variable "name" {
  type        = string
  description = "Name for NAT"
  default     = "nat"
}

variable "tags" {
  type        = map(any)
  description = "Tags for NAT"
  default     = {}
}

variable "eip_vpc" {
  type        = bool
  description = "Boolean if the EIP is in a VPC or not"
  default     = true
}

variable "eip_name" {
  type        = string
  description = "Name for EIP"
  default     = "eip"
}

variable "eip_tags" {
  type        = map(any)
  description = "Tags for EIP"
  default     = {}
}