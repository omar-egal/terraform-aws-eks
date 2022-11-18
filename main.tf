#---root/main.tf---

module "networking" {
  source                  = "./networking"
  vpc_cidr                = local.vpc_cidr
  public_cidrs            = [for i in range(2, 255, 2) : cidrsubnet(local.vpc_cidr, 8, i)]
  map_public_ip_on_launch = true
  access_ip               = var.access_ip
  public_sn_count         = 2
  max_subnets             = 20
}

module "security" {
  source          = "./security"
  vpc_id          = module.networking.vpc_id
  security_groups = local.security_groups
}

module "eks" {
  source                             = "./eks"
  cluster_name                       = "eks-cluster-${substr(uuid(), 0, 5)}"
  node_group_name                    = "week22-node-group"
  endpoint_public_access             = true
  public_subnets                     = module.networking.public_subnets
  AmazonEKSClusterPolicy             = module.security.AmazonEKSClusterPolicy
  AmazonEKSVPCResourceController     = module.security.AmazonEKSVPCResourceController
  cluster_role_arn                   = module.security.cluster_role_arn
  node_role_arn                      = module.security.node_role_arn
  AmazonEKSWorkerNodePolicy          = module.security.AmazonEKSWorkerNodePolicy
  AmazonEKS_CNI_Policy               = module.security.AmazonEKS_CNI_Policy
  AmazonEC2ContainerRegistryReadOnly = module.security.AmazonEC2ContainerRegistryReadOnly
  security_group_ids                 = module.security.security_group_id
  sc_desired_size                    = 1
  sc_max_size                        = 1
  sc_min_size                        = 1
  instance_types                     = ["t3.small"]
  capacity_type                      = "SPOT"
}