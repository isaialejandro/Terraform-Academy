

variable "vpc_name" {
  type = string
  description = "Default VPC name."
}

variable "vpc_environment" {
  type = string
  description = "Current working environment."
}

variable "vpc_cidr" {
  type = string
  description = "Default VPC CIDR."
}

variable "availability_zones" {
  type = list(string)
  description = "List of AZ´s."
}

variable "public_subnet_cidrs" {
  type = list(string)
  description = "List of Public Subnet CIDRs."

  validation {
    condition = length(var.public_subnet_cidrs) == 2
    error_message = "At least 2 CIDRs are required."
  }
}

variable "private_subnet_cidr" {
  type = string
  description = "Private Subnet CIDR."
}