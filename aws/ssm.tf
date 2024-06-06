# System Manager Parameter Store
## TOKEN_SECRETKEY
resource "aws_ssm_parameter" "token_secret_key" {
  name        = "/tokenSecretKey"
  description = "token secret key"
  type        = "SecureString"
  value       = "jwtsecretKeyhastolonghowlongidontknow" // todo fix
}

## CORS_PATH_PATTERNS
resource "aws_ssm_parameter" "cors_path_patterns" {
  name        = "/cors/path-patterns"
  description = "CORS path patterns"
  type        = "SecureString"
  value       = "/**"
}

## CORS_ORIGIN_PATTERNS
resource "aws_ssm_parameter" "cors_origin_patterns" {
  name        = "/cors/origin-patterns"
  description = "CORS origin patterns"
  type        = "SecureString"
  value       = "http://localhost:3000" // todo fix
}

## CORS_ALLOWED_METHODS
resource "aws_ssm_parameter" "cors_allowed_methods" {
  name        = "/cors/allowed-methods"
  description = "CORS allowed methods"
  type        = "SecureString"
  value       = "*"
}

## CORS_ALLOWED_HEADERS
resource "aws_ssm_parameter" "cors_allowed_headers" {
  name        = "/cors/allowed-headers"
  description = "CORS allowed methods"
  type        = "SecureString"
  value       = "*"
}

## CORS_EXPOSED_HEADERS
resource "aws_ssm_parameter" "cors_exposed_headers" {
  name        = "/cors/exposed-headers"
  description = "CORS exposed headers"
  type        = "SecureString"
  value       = "Set-Cookie, Authorization, Content-Type, X-Requested-With, Accept, Origin, Access-Control-Request-Method, Access-Control-Request-Headers, Access-Control-Allow-Origin, Access-Control-Allow-Credentials"
}

## CORS_ALLOW_CREDENTIALS
resource "aws_ssm_parameter" "cors_allow_credentials" {
  name        = "/cors/allow-credentials"
  description = "CORS allow credentials"
  type        = "SecureString"
  value       = "true"
}

## CORS_MAX_AGE
resource "aws_ssm_parameter" "cors_max_age" {
  name        = "/cors/max-age"
  description = "CORS max age"
  type        = "SecureString"
  value       = "1800"
}

## COOKIE_DOMAIN
resource "aws_ssm_parameter" "cookie_domain" {
  name        = "/cookie/domain"
  description = "Cookie domain"
  type        = "SecureString"
  value       = "localhost" // todo fix
}

## COOKIE_PATH
resource "aws_ssm_parameter" "cookie_path" {
  name        = "/cookie/path"
  description = "Cookie path"
  type        = "SecureString"
  value       = "/" // todo fix
}

## COOKIE_MAX_AGE
resource "aws_ssm_parameter" "cookie_max_age" {
  name        = "/cookie/max-age"
  description = "Cookie max age"
  type        = "SecureString"
  value       = "86400" // todo
}

## DB_HOSTNAME
resource "aws_ssm_parameter" "db_hostname" {
  name        = "/db/hostname"
  description = "DB hostname"
  type        = "SecureString"
  value       = "jdbc:mysql://${aws_db_instance.rds.address}:${aws_db_instance.rds.port}"
}

## DB_USERNAME
resource "aws_ssm_parameter" "db_username" {
  name        = "/db/username"
  description = "DB username"
  type        = "SecureString"
  value       = aws_db_instance.rds.username
}

## DB_PASSWORD
resource "aws_ssm_parameter" "db_password" {
  name        = "/db/password"
  description = "DB password"
  type        = "SecureString"
  value       = aws_db_instance.rds.password
}

## S3_URL
resource "aws_ssm_parameter" "s3_url" {
  name        = "/s3/url"
  description = "S3 URL"
  type        = "SecureString"
  value       = "s3://${aws_s3_bucket.bucket.id}"
}

## S3_ACCESS_KEY
resource "aws_ssm_parameter" "s3_access_key" {
  name        = "/s3/access-key"
  description = "S3 access key"
  type        = "SecureString"
  value       = var.access_key
}

## S3_SECRET_KEY
resource "aws_ssm_parameter" "s3_secret_key" {
  name        = "/s3/secret-key"
  description = "S3 secret key"
  type        = "SecureString"
  value       = var.secret_key
}

## S3_BUCKET_NAME
resource "aws_ssm_parameter" "s3_bucket_name" {
  name        = "/s3/bucket-name"
  description = "S3 bucket name"
  type        = "SecureString"
  value       = aws_s3_bucket.bucket.bucket
}

## S3_REGION
resource "aws_ssm_parameter" "s3_region" {
  name        = "/s3/region"
  description = "S3 region"
  type        = "SecureString"
  value       = var.region
}

## MAX_ATTEMPTS
resource "aws_ssm_parameter" "max_attempts" {
  name        = "/max/attempts"
  description = "Max attempts"
  type        = "SecureString"
  value       = "3"
}

## BACK_OFF_PERIOD
resource "aws_ssm_parameter" "back_off_period" {
  name        = "/back-off/period"
  description = "Back off period"
  type        = "SecureString"
  value       = "2000"
}

## KAKO_HOST
resource "aws_ssm_parameter" "kako_host" {
  name        = "/kako/host"
  description = "Kako host"
  type        = "SecureString"
  value       = "https://kauth.kakao.com"
}

## KAKO_ADMIN_KEY
resource "aws_ssm_parameter" "kako_admin_key" {
  name        = "/kako/admin-key"
  description = "Kako admin key"
  type        = "SecureString"
  value       = var.kakao_admin_key
}

## KAKO_TOKEN_URI
resource "aws_ssm_parameter" "kako_token_uri" {
  name        = "/kako/token-uri"
  description = "Kako token URI"
  type        = "SecureString"
  value       = "https://kauth.kakao.com/oauth/token"
}

## KAKO_TOKEN_INFO_URI
resource "aws_ssm_parameter" "kako_token_info_uri" {
  name        = "/kako/token-info-uri"
  description = "Kako token info URI"
  type        = "SecureString"
  value       = "https://kapi.kakao.com/v1/user/access_token_info"
}

## KAKO_ME_INFO_URI
resource "aws_ssm_parameter" "kako_me_info_uri" {
  name        = "/kako/me-info-uri"
  description = "Kako me info URI"
  type        = "SecureString"
  value       = "https://kapi.kakao.com/v2/user/me"
}

## KAKO_UNLINK_URI
resource "aws_ssm_parameter" "kako_unlink_uri" {
  name        = "/kako/unlink-uri"
  description = "Kako unlink URI"
  type        = "SecureString"
  value       = "https://kapi.kakao.com/v1/user/unlink"
}

## KAKO_APP_REDIRECT_URI
resource "aws_ssm_parameter" "kako_app_redirect_uri" {
  name        = "/kako/app-redirect-uri"
  description = "Kako app redirect URI"
  type        = "SecureString"
  value       = var.kako_app_redirect_uri
}

## KAKO_APP_CLIENT_ID
resource "aws_ssm_parameter" "kako_app_client_id" {
  name        = "/kako/app-client-id"
  description = "Kako app client ID"
  type        = "SecureString"
  value       = var.kakao_app_client_id
}
