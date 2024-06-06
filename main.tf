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
  source                = "./aws"
  access_key            = var.aws_access_key
  secret_key            = var.aws_secret_key
  rds_username          = var.aws_rds_username
  rds_password          = var.aws_rds_password
  kakao_admin_key       = var.kakao_admin_key
  kako_app_redirect_uri = var.kako_app_redirect_uri
  kakao_app_client_id   = var.kakao_app_client_id
}
