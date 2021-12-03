variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "tags" {
  type        = map(string)
  description = "Tags for IGW"
  default     = {}
}

variable "name" {
  type        = string
  description = "name for igw"
  default     = "igw"
}