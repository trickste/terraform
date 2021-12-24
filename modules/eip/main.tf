resource "aws_eip" "eip" {
  vpc                       = var.vpc
  instance                  = var.instance_id
  associate_with_private_ip = var.associate_with_private_ip
  network_interface         = var.network_interface
  customer_owned_ipv4_pool  = var.customer_owned_ipv4_pool
  address                   = var.address
  public_ipv4_pool          = var.public_ipv4_pool
  tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}