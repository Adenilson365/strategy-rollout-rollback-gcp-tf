output "stack_subnet" {
  value = module.network-gcp.subnet_id[*].us-east1.id
}