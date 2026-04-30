
# ======================================
# Global Project Variables
# ======================================


variable "environment" {
  type        = string
  default     = "develop"
  description = "Dfault environment for the Project."
}

variable "vpc_az" {
  type        = string
  default     = "us-east-1a"
  description = "Default Ec2 subnets Az´s."
}



# ======================
# S3 Remote State Config
# ======================


variable "s3_bucket_name" {
  type        = string
  default     = "IA-TF - Academy-S3-23048sdkjfh_"
  description = "Temporary remote state bucket"
}

variable "s3_bucket_key" {
  type    = string
  default = "terraform-academy/first_lab/"
}


# ======================================
# VPC Variables
# ======================================


variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Default CIDR for VPC."
}


# ======================================
# EC2 Variables
# ======================================


variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Default Ec2 instance type for Lab Machines."
}
