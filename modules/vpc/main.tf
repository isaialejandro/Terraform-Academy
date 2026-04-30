# VPC Local Module.

# ---- Main VPC ----
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${local.resource_prefix} - VPC"
  }
}

# ---- Public Subnets ----
# One public Subet definition ONLY.
# resource "aws_subnet" "public" {
#   vpc_id = aws_vpc.this.id
#   cidr_block = var.public_subnet_cidr
#   availability_zone = var.availability_zones[count.index]
#   map_public_ip_on_launch = true

#   tags = {
#     Name = "${local.resource_prefix}-${var.vpc_name}-public"
#   }
# }

resource "aws_subnet" "public" {
  count = 2 # Public Sunbnets creation"
  vpc_id = aws_vpc.this.id
  cidr_block = var.public_subnet_cidrs[count.index]
  availability_zone = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${local.resource_prefix}-${var.vpc_name}-public"
  }
}

# ---- Private Subnet -----
resource "aws_subnet" "private" {
  vpc_id = aws_vpc.this.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.availability_zones[0]

  tags = {
    Name = "${local.resource_prefix}-${var.vpc_name}-private"
  }
}

# --- Internet Gateway & Routing ----
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${local.resource_prefix} - IGW"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  # default Routing definition:
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${local.resource_prefix}-${var.vpc_name}"
  }
}

# ---- Route Table Association ----
resource "aws_route_table_association" "public" {
  subnet_id = aws_subnet.public[0].id
  route_table_id = aws_route_table.public.id
}
