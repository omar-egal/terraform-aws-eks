data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

data "aws_instances" "my_worker_nodes" {
  instance_tags = {
    "kubernetes.io/cluster/${module.eks.cluster_name}" = "owned"
  }
  instance_state_names = ["running"]
  depends_on           = [module.eks.node_group]
}