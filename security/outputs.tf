#---security/outputs.tf---

output "cluster_role_arn" {
  value = aws_iam_role.cluster_role.arn
}

output "node_role_arn" {
    value = aws_iam_role.node_role.arn
}

output "AmazonEKSClusterPolicy" {
  value = aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
}

output "AmazonEKSVPCResourceController" {
  value = aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
}

output "AmazonEKSWorkerNodePolicy" {
  value = aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy
}

output "AmazonEKS_CNI_Policy" {
  value = aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
}

output "AmazonEC2ContainerRegistryReadOnly" {
  value = aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
}