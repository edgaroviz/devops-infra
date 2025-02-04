output "cluster_id" {
  description = "EKS Cluster ID"
  value       = module.eks.cluster_id
}

output "cluster_endpoint" {
  description = "EKS Cluster API endpoint"
  value       = module.eks.cluster_endpoint
}

output "cluster_arn" {
  description = "EKS Cluster ARN"
  value       = module.eks.cluster_arn
}

output "oidc_provider_arn" {
  description = "OIDC provider ARN for IAM roles"
  value       = module.eks.oidc_provider_arn
}