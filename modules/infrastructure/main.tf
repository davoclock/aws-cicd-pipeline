resource "aws_vpc" "default" {
  cidr_block = "1.2.0.0/16"
  tags = {
    Name = "demo-vpc-1"
  }
}