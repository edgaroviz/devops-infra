module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "ze-${var.environment}-${var.region}-eks"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }

  # 🔹 Fixed `access_entries`: changed `{}` to `[]`
  # 🔹 Fix: Change `access_entries` to a Map (`{}`)
  access_entries = {
    edgaroviz7 = {
      cluster_name      = "ze-${var.environment}-${var.region}-eks"
      principal_arn     = "arn:aws:iam::920373021859:user/edgaroviz7"
      type              = "STANDARD"
    }
  } 

  # eks_managed_node_groups = {
  #   general-purpose = {
  #     min_size     = 1
  #     max_size     = 3
  #     desired_size = 1
  #     instance_types = ["t3.medium"]
  #   }
  # }

  create_kms_key = false
  cluster_encryption_config = {}

  # Disable CloudWatch logging
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