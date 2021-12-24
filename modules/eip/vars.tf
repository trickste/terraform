variable "vpc" {
  type        = bool
  description = "Boolean if the EIP is in a VPC or not"
  default     = true
}

variable "instance_id" {
  type        = string
  description = "EC2 instance ID"
  default     = null
}

variable "associate_with_private_ip" {
  type        = string
  description = " User-specified primary or secondary private IP address to associate with the Elastic IP address. If no private IP address is specified, the Elastic IP address is associated with the primary private IP address"
  default     = null
}

variable "network_interface" {
  type        = string
  description = "Network interface ID to associate with"
  default     = null
}

variable "customer_owned_ipv4_pool" {
  type        = string
  description = "ID of a customer-owned address pool. For more on customer owned IP addressed check out Customer-owned IP addresses guide"
  default     = null
}

variable "address" {
  type        = string
  description = "IP address from an EC2 BYOIP pool. This option is only available for VPC EIPs"
  default     = null
}

variable "public_ipv4_pool" {
  type        = string
  description = "EC2 IPv4 address pool identifier or amazon. This option is only available for VPC EIPs"
  default     = null
}

variable "name" {
  type        = string
  description = "Name for EIP"
  default     = "eip"
}

variable "tags" {
  type        = map(any)
  description = "Tags for EIP"
  default     = {}
}