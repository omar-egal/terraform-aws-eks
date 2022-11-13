#---root/main.tf---

module "networking" {
  source          = "./networking"
  vpc_cidr        = local.vpc_cidr
  public_cidrs    = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  access_ip       = var.access_ip
  public_sn_count = 1
  max_subnets     = 20
}