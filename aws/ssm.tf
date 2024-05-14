# System Manager Parameter Store
resource "aws_ssm_parameter" "secure_string" {
  name        = "/test/secure-string"
  description = "A test parameter"
  type        = "SecureString"
  value       = "SecureString"
}

resource "aws_ssm_parameter" "string" {
  name        = "/test/string"
  description = "A test parameter"
  type        = "String"
  value       = "String"
}
