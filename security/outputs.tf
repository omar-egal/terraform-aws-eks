#---security/outputs.tf---

output "role_arn" {
  value = aws_iam_role.cluster_role.arn
}

output "AmazonEKSClusterPolicy" {
  value = aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
}

output "AmazonEKSVPCResourceController" {
  value = aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
}