resource "aws_vpc" "default" {
  cidr_block = "1.2.0.0/16"
  tags = {
    Name = var.application_name

    tags = merge({
      env = var.environment
    }, var.tags)
  }
}