#---eks/main.tf---

resource "aws_eks_cluster" "cluster" {
  name     = "cluster"
  role_arn = var.role_arn

  vpc_config {
    subnet_ids = var.public_subnets
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    var.AmazonEKSClusterPolicy,
    var.AmazonEKSVPCResourceController,
  ]
}