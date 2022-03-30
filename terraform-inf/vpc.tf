# Resource: aws_vpc
# https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/latest

# provision address space of 10.10.{10-11}.*  ; 2*256 hosts
# 10.10.10.* will contain two private subnets
# 10.10.11.* will contain two public subnets
# each subnet will have capacity for 128 hosts
resource "aws_vpc" "main" {
  cidr_block                     = "10.10.10.0/23"
  enable_classiclink             = false
  enable_classiclink_dns_support = false

  tags = {
    Name = "main-vpc"
  }
}
