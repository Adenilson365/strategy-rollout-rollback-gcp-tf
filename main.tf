terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "6.5.0"
    }
  }
}

module "network-gcp" {
  source        = "./modules/network"
  vpc_name      = "vpc-strategy-rollout-rollback-gcp"
  subnet_name   = "sub-strategy-rollout-rollback-gcp"
  firewall_name = "fir-strategy-rollout-rollback-gcp"
  vpc_regions   = ["us-east1"]
}