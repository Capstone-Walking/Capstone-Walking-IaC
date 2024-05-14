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
