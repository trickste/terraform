variable "create_vpc" {
  type        = bool
  description = "specify to create vpc or not"
  default     = true
}

variable "vpc_id" {
  type        = string
  description = "VPC id if vpc is not created in the module"
  default     = null
}

variable "cidr_block" {
  type        = string
  description = "CIDR clock for VPC"
  default     = "10.0.0.0/16"
}

variable "enable_dns_support" {
  type        = bool
  description = "Enble DNS or not in VPC"
  default     = true
}

variable "enable_dns_hostnames" {
  type        = bool
  description = "Enble DNS Hostname or not in VPC"
  default     = true
}

variable "instance_tenancy" {
  type        = string
  description = "Instance tenancy for VPC"
  default     = "default"
}

variable "enable_classiclink" {
  type        = bool
  description = "Enable classlink for VPC or not"
  default     = false
}

variable "enable_classiclink_dns_support" {
  type        = bool
  description = "A boolean flag to enable/disable ClassicLink DNS Support for the VPC "
  default     = false
}

variable "assign_generated_ipv6_cidr_block" {
  type        = bool
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC."
  default     = false
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

################### IGW ###################

variable "create_igw" {
  type        = bool
  description = "A boolean flag to create IGW or not"
  default     = true
}

variable "igw_tags" {
  type        = map(any)
  description = "Map for Tags for IGW"
  default     = null
}

############## Public Subnet ##############

variable "public_subnet" {
  type        = any
  description = "Map of Subnet configurations"
  default     = []
}

variable "public_subnet_name" {
  type        = string
  description = "public subnet name in the vpc"
  default     = "public-subnet"
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  description = "indicate that network interfaces created in all subnet should be assigned an IPv6 address"
  default     = false
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "indicate that network interfaces created in public subnets should be assigned an IPv6 address"
  default     = false
}

variable "public_subnet_tags" {
  type        = map(any)
  description = "Default Map for Tags for Public Subnets"
  default     = null
}

############## PRIVATE SUBNET #############

variable "private_subnet" {
  type        = any
  description = "Map of Subnet configurations"
  default     = []
}

variable "private_subnet_name" {
  type        = string
  description = "private subnet name in the vpc"
  default     = "private-subnet"
}

variable "private_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "indicate that network interfaces created in private subnets should be assigned an IPv6 address"
  default     = false
}

variable "private_subnet_tags" {
  type        = map(any)
  description = "Default Map for Tags for private Subnets"
  default     = null
}

############ PROTECTED SUBNET ############

variable "protected_subnet" {
  type = any
  description = "Map of Subnet configurations"
  default = []
}

variable "protected_subnet_name" {
  type        = string
  description = "protected subnet name in the vpc"
  default     = "protected-subnet"
}

variable "protected_subnet_assign_ipv6_address_on_creation" {
  type        = bool
  description = "indicate that network interfaces created in protected subnets should be assigned an IPv6 address"
  default     = false
}

variable "protected_subnet_tags" {
  type        = map(any)
  description = "Default Map for Tags for protected Subnets"
  default     = null
}