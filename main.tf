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

module "gke" {
  source            = "./modules/gke"
  gke_name          = "strategy-rollout-rollback-gcp-tf"
  gke_location      = "us-east1"
  gke_node_count    = 2
  gke_service_account = "terraform-sa@fit-aleph-436317-h4.iam.gserviceaccount.com"
  gke_network       = module.network-gcp.vpc_name
  gke_subnet        = "subnet-us-east1"
  gke_disk_size     = 12
  gke_disk_type     = "pd-standard"
  gke_deletion_protection = false
  depends_on = [ module.network-gcp ]
}