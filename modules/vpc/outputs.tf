
output "vpc_id" {
  description = "Current ID of VPC."
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "Current CIDR block for the VPC."
  value = aws_vpc.this.cidr_block
}

output "public_subnet_ids" {
  description = "List of ID´s of ALL public Subnets."
  value = aws_subnet.public[*].id
}

output "private_subnet_id" {
  description = "ID for Private Subnet."
  value = aws_subnet.private.id
}