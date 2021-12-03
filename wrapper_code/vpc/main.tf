module "vpc" {
  source     = "../../modules/vpc"
  create_igw = var.create_igw
}