output "id" {
  value = var.create_nat ? aws_nat_gateway.nat[0].id : null
}

output "allocation_id" {
  value = var.create_nat ? aws_nat_gateway.nat[0].allocation_id : null
}

output "subnet_id" {
  value = var.create_nat ? aws_nat_gateway.nat[0].subnet_id : null
}

output "tags" {
  value = var.create_nat ? aws_nat_gateway.nat[0].tags_all : null
}