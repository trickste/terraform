variable "vpc_id" {
  type        = string
  description = "VPC id of vpc"
}

variable "cidr_block" {
  type        = string
  description = "cidr block for subnet"
}

variable "availability_zone" {
  type        = string
  description = "availability zone for the subnet"
}

variable "map_customer_owned_ip_on_launch" {
  type        = bool
  description = "if customer owner ip is to be used or not"
  default     = false
}

variable "customer_owned_ipv4_pool" {
  type        = string
  description = "customer_owned_ipv4_pool"
  default     = null
}

variable "outpost_arn" {
  type        = string
  description = "outpost_arn"
  default     = null
}

variable "ipv6_cidr_block" {
  type        = string
  description = "ipv6_cidr_block"
  default     = null
}

variable "name" {
  type        = string
  description = "Name of subnet"
  default     = "subnet"
}

variable "tags" {
  type        = map(string)
  description = "tags"
  default     = {}
}