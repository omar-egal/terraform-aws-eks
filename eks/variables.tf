#---eks/variables.tf---

variable "cluster_name" {}  

variable "public_subnets" {}

variable "AmazonEKSClusterPolicy" {}

variable "AmazonEKSVPCResourceController" {}

variable "cluster_role_arn" {}

variable "node_role_arn" {}

variable "AmazonEKSWorkerNodePolicy" {}

variable "AmazonEKS_CNI_Policy" {}

variable "AmazonEC2ContainerRegistryReadOnly" {}