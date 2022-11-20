#---eks/outputs.tf---

output "endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.cluster.certificate_authority[0].data
}

output "cluster_id" {
  value = aws_eks_cluster.cluster.id
}

output "cluster_name" {
  value = aws_eks_cluster.cluster.name
}

output "node_group" {
  value = aws_eks_node_group.node_group
}