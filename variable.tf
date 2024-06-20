variable "aws_access_key" {
  type        = string
  sensitive   = true
  description = "The access key for the IAM root user"
}

variable "aws_secret_key" {
  type        = string
  sensitive   = true
  description = "The secret key for the IAM root user"
}

variable "aws_rds_username" {
  type        = string
  default     = "root"
  description = "The username for the RDS instance"
}

variable "aws_rds_password" {
  type        = string
  default     = "thisisrdspassword"
  description = "The password for the RDS instance"
}

// todo fill
variable "kakao_admin_key" {
  type        = string
  default     = "kakao_admin_key"
  description = "Kakao admin key"
}

// todo fill
variable "kako_app_redirect_uri" {
  type        = string
  default     = "kako_app_redirect_uri"
  description = "Kakao app redirect uri"
}

// todo fill
variable "kakao_app_client_id" {
  type        = string
  default     = "kakao_web_client_id"
  description = "Kakao web client id"
}

variable "fe_origin" {
  type        = string
  default     = "fe_origin"
  description = "Frontend origin"
}
