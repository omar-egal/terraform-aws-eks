#---root/main.tf---

module "networking" {
  source          = "./networking"
  vpc_cidr        = local.vpc_cidr
  public_cidrs    = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  access_ip       = var.access_ip
  public_sn_count = 2
  max_subnets     = 20
}

module "security" {
  source          = "./security"
  vpc_id          = module.networking.vpc_id
  security_groups = local.security_groups
}

module "eks" {
  source                         = "./eks"
  public_subnets                 = module.networking.public_subnets
  AmazonEKSClusterPolicy         = module.security.AmazonEKSClusterPolicy
  AmazonEKSVPCResourceController = module.security.AmazonEKSVPCResourceController
  role_arn                       = module.security.role_arn

}