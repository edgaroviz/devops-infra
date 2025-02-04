locals {
  environment = "prod"
  region = "eu-west-1"
  vpc = {
    public_subnets = ["10.0.10.0/24", "10.0.20.0/24"]
    private_subnets = ["10.0.30.0/24", "10.0.40.0/24"]
  }
  eks = {
    # subnet_id = 
  }
}