variable "prefix" {
  type        = string
  default     = "tf"
  description = "The prefix to use for all resources"
}

variable "access_key" {
  type        = string
  sensitive   = true
  description = "The access key for the IAM root user"
}

variable "secret_key" {
  type        = string
  sensitive   = true
  description = "The secret key for the IAM root user"
}

variable "region" {
  type        = string
  default     = "ap-northeast-2"
  description = "The region to deploy to"
}

variable "availability_zones" {
  type        = list(string)
  default     = ["ap-northeast-2a", "ap-northeast-2c"]
  description = "The availability zones to use for the subnets"
}


variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The instance type to use for the EC2 instances"
}

variable "lc_image_id" {
  type        = string
  default     = "ami-04607756254222deb"
  description = "The ID of the AMI to use for the launch configuration"
}
