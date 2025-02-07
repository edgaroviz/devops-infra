module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name                 = "${var.environment}-${var.region}-ze-vpc"
  cidr                 = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  azs             = ["${var.region}a", "${var.region}b"]
  
  public_subnets  = var.public_subnets
  
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

  enable_vpn_gateway = false
  enable_ipv6        = false
  private_subnet_tags = {
    "kubernetes.io/role/internal-elb" = "1"
  }
  tags = {
    Terraform = "true"
    Environment = var.environment
  }
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnets
}

output "private_subnet_ids" {
  value = module.vpc.private_subnets
}
