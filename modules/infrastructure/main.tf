resource "aws_vpc" "default" {
  cidr_block = "1.2.0.0/16"

  tags = merge({
    env  = var.environment
    Name = var.application_name
  }, var.tags)
}