module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name    = "${var.environment}-${var.region}-ze-eks"
  cluster_version = "1.31"

  # Optional
  cluster_endpoint_public_access = true

  # Optional: Adds the current caller identity as an administrator via cluster access entry
  enable_cluster_creator_admin_permissions = true
  cluster_upgrade_policy = {
    support_type = "STANDARD"
  }

  cluster_compute_config = {
    enabled    = true
    node_pools = ["general-purpose"]
  }

  vpc_id     = var.vpc_id
  # subnet_ids = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
  subnet_ids = var.subnet_ids

  tags = {
    Environment = var.environment
    Terraform   = "true"
  }
}