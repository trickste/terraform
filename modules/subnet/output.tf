output "id" {
  value = aws_subnet.subnet.id
}

output "arn" {
  value = aws_subnet.subnet.arn
}

output "ipv6_cidr_block_association_id" {
  value = aws_subnet.subnet.ipv6_cidr_block_association_id
}

output "cidr" {
  value = var.cidr_block
}

output "tags" {
  value = aws_subnet.subnet.tags_all
}
