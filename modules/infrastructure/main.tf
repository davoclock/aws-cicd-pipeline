resource "aws_vpc" "default" {
  name: "demo-vpc"
  cidr_block = "1.2.0.0/16"
}