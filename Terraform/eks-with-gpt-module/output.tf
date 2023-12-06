# output "kubeconfig" {
#   description = "Kubeconfig content for connecting to the EKS cluster"
#   value       = module.eks_cluster.kubeconfig
# }

output "cluster_name" {
  description = "Name of the created EKS cluster"
  value       = module.eks_cluster.cluster_id
}
