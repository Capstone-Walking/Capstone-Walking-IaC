resource "aws_acm_certificate" "cert" {
  domain_name       = "*.${var.domain_name}"
  validation_method = "DNS"

  tags = {
    Environment = "tf"
  }

  lifecycle {
    create_before_destroy = true
  }
}
