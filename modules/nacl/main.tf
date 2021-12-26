resource "aws_network_acl" "nacl" {
  count      = var.nacl_id == null && var.create_nacl ? 1 : 0
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}

resource "aws_network_acl_rule" "ingress_rules" {
  count           = var.ingress_rules != null ? length(var.ingress_rules) : 0
  network_acl_id  = var.nacl_id != null? var.nacl_id : aws_network_acl.nacl[0].id
  rule_number     = lookup(var.ingress_rules[count.index], "rule_number")
  egress          = false
  protocol        = lookup(var.ingress_rules[count.index], "protocol")
  rule_action     = lookup(var.ingress_rules[count.index], "rule_action")
  cidr_block      = lookup(var.ingress_rules[count.index], "ipv6_cidr_block", null) == null ? lookup(var.ingress_rules[count.index], "cidr_block", null) : null
  from_port       = lookup(var.ingress_rules[count.index], "from_port", null)
  to_port         = lookup(var.ingress_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.ingress_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.ingress_rules[count.index], "icmp_type", null)
  ipv6_cidr_block = lookup(var.ingress_rules[count.index], "ipv6_cidr_block", null)
}

resource "aws_network_acl_rule" "egress_rules" {
  count           = var.egress_rules != null ? length(var.egress_rules) : 0
  network_acl_id  = var.nacl_id != null? var.nacl_id : aws_network_acl.nacl[0].id
  rule_number     = lookup(var.egress_rules[count.index], "rule_number")
  egress          = true
  protocol        = lookup(var.egress_rules[count.index], "protocol")
  rule_action     = lookup(var.egress_rules[count.index], "rule_action")
  cidr_block      = lookup(var.egress_rules[count.index], "ipv6_cidr_block", null) == null ? lookup(var.egress_rules[count.index], "cidr_block", null) : null
  from_port       = lookup(var.egress_rules[count.index], "from_port", null)
  to_port         = lookup(var.egress_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.egress_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.egress_rules[count.index], "icmp_type", null)
  ipv6_cidr_block = lookup(var.egress_rules[count.index], "ipv6_cidr_block", null)
}
