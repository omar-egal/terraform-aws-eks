#---eks/variables.tf---

variable "cluster_name" {}

variable "node_group_name" {}

variable "public_subnets" {}

variable "security_group_ids" {}

variable "AmazonEKSClusterPolicy" {}

variable "AmazonEKSVPCResourceController" {}

variable "cluster_role_arn" {}

variable "node_role_arn" {}

variable "AmazonEKSWorkerNodePolicy" {}

variable "AmazonEKS_CNI_Policy" {}

variable "AmazonEC2ContainerRegistryReadOnly" {}

variable "sc_desired_size" {}

variable "sc_max_size" {}

variable "sc_min_size" {}

variable "instance_types" {}

variable "capacity_type" {}