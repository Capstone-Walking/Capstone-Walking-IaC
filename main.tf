# Cloud
terraform {
  cloud {
    organization = "tr-org"
    hostname     = "app.terraform.io"
    workspaces {
      name = "tr-org-work"
    }
  }
}

# AWS
module "aws" {
  source     = "./aws"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
