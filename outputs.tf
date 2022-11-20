#---root/outputs.tf---


output "cluster_id" {
  description = "EKS cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value       = module.eks.endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = module.eks.cluster_name
}

output "my_worker_nodes" {
  value = { for i in range(length(data.aws_instances.my_worker_nodes.ids)) : data.aws_instances.my_worker_nodes.ids[i] => data.aws_instances.my_worker_nodes.private_ips[i] }
}