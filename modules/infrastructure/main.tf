resource "aws_vpc" "default" {
  cidr_block = "1.2.0.0/32"

  tags = merge({
    application-name = var.application_name
    env              = var.environment
    Name = "${var.environment}-${var.application_name}"
  }, var.tags)
}