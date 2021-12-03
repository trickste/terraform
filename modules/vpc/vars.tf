variable "cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "enable_classiclink" {
  type    = bool
  default = false
}

variable "enable_classiclink_dns_support" {
  type    = bool
  default = false
}

variable "assign_generated_ipv6_cidr_block" {
  type    = bool
  default = false
}

variable "name" {
  type        = string
  description = "Name for VPC"
  default     = "vpc"
}

variable "tags" {
  type        = map(string)
  description = "Tags for VPC"
  default     = {}
}

variable "create_igw" {
    type = bool
    default = true
}