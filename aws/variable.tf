variable "prefix" {
  type        = string
  default     = "tf"
  description = "The prefix to use for all resources"
}

// set at root
variable "domain_name" {
  type        = string
  description = "The domain name for the Route 53 hosted zone"
}

// set at root
variable "access_key" {
  type        = string
  sensitive   = true
  description = "The access key for the IAM root user"
}

// set at root
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

variable "rds_db_name" {
  type        = string
  default     = "mydb"
  description = "The name of the database to create in the RDS instance"
}

variable "rds_username" {
  type        = string
  default     = "root"
  description = "The username for the RDS instance"
}

variable "rds_password" {
  type        = string
  default     = "thisisrdspassword"
  description = "The password for the RDS instance"
}

variable "rds_instance_class" {
  type        = string
  default     = "db.t3.micro"
  description = "The instance class for the RDS instance"
}

variable "rds_engine" {
  type        = string
  default     = "MySQL"
  description = "The engine for the RDS instance"
}

variable "rds_engine_version" {
  type        = string
  default     = "8.0.35"
  description = "The engine version for the RDS instance"
}

variable "rds_allocated_storage" {
  type        = number
  default     = 20
  description = "The allocated storage for the RDS instance"
}

// set at root
variable "fe_origin" {
  type        = string
  default     = "fe_origin"
  description = "Frontend origin"
}

// set at root
variable "kakao_admin_key" {
  type        = string
  default     = "kakao_admin_key"
  description = "Kakao admin key"
}

// set at root
variable "kako_app_redirect_uri" {
  type        = string
  default     = "kako_app_redirect_uri"
  description = "Kakao app redirect uri"
}

// set at root
variable "kakao_app_client_id" {
  type        = string
  default     = "kakao_web_client_id"
  description = "Kakao web client id"
}

variable "schedular_interval" {
  type        = number
  default     = 70
  description = "The interval in minutes to run the scheduler"
}

variable "data_interval" {
  type        = number
  default     = 20
  description = "The interval in minutes to run the data collector"
}

variable "maximum_search_count" {
  type        = number
  default     = 5
  description = "The maximum number of search results to return"
}

variable "access_token_validtime" {
  type        = number
  default     = 31557600000
  description = "The time in minutes that an access token is valid for"
}

variable "refresh_token_validtime" {
  type        = number
  default     = 31557600000
  description = "The time in minutes that a refresh token is valid for"
}

// set at root
variable "seoul_api_key" {
  type        = string
  default     = "seoul_api_key"
  description = "Seoul API key"
}
