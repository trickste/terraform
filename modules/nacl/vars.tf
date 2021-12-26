variable "create_nacl" {
    type = bool
    description = "Boolean to check weather to create NACL or not"
    default = true 
}

variable "nacl_id" {
    type = string
    description = "NACL ID if nacl is not to be created"
    default = null
}

variable "name" {
    type = string
    description = "Name for NACL"
    default = "nacl"
}

variable "vpc_id" {
    type = string
    description = "The ID of the associated VPC"
    default = null
}

variable "subnet_ids" {
    type = list(string)
    description = "A list of Subnet IDs to apply the ACL to"
    default = []
}

variable "tags" {
  type        = map(any)
  description = "Tags for NACL"
  default     = {}
}

variable "ingress_rules" {
    type = any
    description = "Ingress rules for NACL"
    default = []
}

variable "egress_rules" {
    type = any
    description = "Egress rules for NACL"
    default = []
}