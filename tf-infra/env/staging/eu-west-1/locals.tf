locals {
  environment = "staging"
  region = "eu-west-1"
  vpc = {
    public_subnets = ["10.0.11.0/24", "10.0.21.0/24"]
    private_subnets = ["10.0.31.0/24", "10.0.41.0/24"]
  }
  eks = {
    # subnet_id = 
  }
}