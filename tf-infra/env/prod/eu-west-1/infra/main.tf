module "vpc" {
  source = "../../../../modules/vpc"

  region = local.region
  
  public_subnets = local.vpc.public_subnets
  private_subnets = local.vpc.private_subnets
  environment = local.environment

}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

module "eks" {
  depends_on = [ module.vpc ]
  source = "../../../../modules/eks"

  environment = local.environment
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
  region = local.region
}

# output "eks_cluster_id" {
#   value = module.eks.eks_cluster_id
# }

# module "argocd" {
#   source = "../../../resources/argocd"
# }