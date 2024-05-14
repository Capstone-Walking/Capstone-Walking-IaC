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
