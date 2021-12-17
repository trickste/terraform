variable "vpc_id" {
    type = string
    description = "The VPC ID"
    default = null
}

variable "name" {
    type = string
    description = "Name for the Route Table"
    default = "route-table"
}

variable "tags" {
    type = map(any)
    description = "A map of tags to assign to the route table"
    default = {}
}

variable "subnet_id" {
    type = string
    description = "subnet id to associate the route table to"
    default = ""
}