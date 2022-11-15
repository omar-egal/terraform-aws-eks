#---eks/main.tf---

resource "aws_eks_cluster" "cluster" {
  name     = var.cluster_name
  role_arn = var.cluster_role_arn

  vpc_config {
    subnet_ids         = var.public_subnets
    security_group_ids = var.security_group_ids
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    var.AmazonEKSClusterPolicy,
    var.AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.cluster.name
  node_group_name = "node-group"
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.public_subnets

  scaling_config {
    desired_size = var.sc_desired_size
    max_size     = var.sc_max_size
    min_size     = var.sc_min_size
  }

  update_config {
    max_unavailable = 1
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    var.AmazonEKSWorkerNodePolicy,
    var.AmazonEKS_CNI_Policy,
    var.AmazonEC2ContainerRegistryReadOnly,
  ]
}