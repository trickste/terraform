output "id" {
    value = var.nacl_id == null && var.create_nacl ? aws_network_acl.nacl[0].id : null
}

output "arn" {
    value = var.nacl_id == null && var.create_nacl ? aws_network_acl.nacl[0].arn : null
}

output "tags" {
    value = var.nacl_id == null && var.create_nacl ? aws_network_acl.nacl[0].tags_all : null
}
