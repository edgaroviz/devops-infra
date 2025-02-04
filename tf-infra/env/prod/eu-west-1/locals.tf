locals {
  environment = "prod"
  region = "eu-west-1"
  vpc = {
    public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  }
  eks = {
    # subnet_id = 
  }
}