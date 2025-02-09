module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "ze-${var.environment}-${var.region}-eks"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }

  access_entries = {
    edgaroviz7 = {
      cluster_name      = "ze-${var.environment}-${var.region}-eks"
      principal_arn     = "arn:aws:iam::920373021859:user/edgaroviz7"
      type              = "STANDARD"
      policy_associations = {
          this = {
            policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
            access_scope = {
              type = "cluster"
            }
          }
      }
    }
  }

  create_kms_key = false
  cluster_encryption_config = {}

  cluster_enabled_log_types = []

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}