## Documentação

### Links
- [Terraform/Providers](https://registry.terraform.io/providers/hashicorp/google/latest/docs)
- [Hashicorp/Terraform](https://developer.hashicorp.com/terraform/language/backend)

### Configuração Inicial
- Crie o arquivo backend.tf e providers.tf
```tf
provider "google" {
  project     = "id_do_projeto"
  credentials = file("seu_credentials")
  region      = "região_default"
}
```
```tf
terraform {
  backend "gcs" {
    bucket      = "nome_do_bucket_de_backend"
    prefix      = ""
    credentials = "arquivo_credentials"
  }
}

data "terraform_remote_state" "foo" {
  backend = "gcs"
  config = {
    bucket = "nome_seu_bucket"
    prefix = "prod"

  }
}

```