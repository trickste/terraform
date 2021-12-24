module "eip" {
  source = "../eip"
  vpc    = var.eip_vpc
  tags = merge(
    {
      Name = var.eip_name
    },
    var.eip_tags
  )
}

resource "aws_nat_gateway" "nat" {
  count             = var.create_nat ? 1 : 0
  allocation_id     = var.connectivity_type == "public" ? module.eip.id : null
  connectivity_type = var.connectivity_type
  subnet_id         = var.subnet_id
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}