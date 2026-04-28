
# ======================================
# Global Project Variables
# ======================================


variable "default_environment" {
  type        = string
  default     = "develop"
  description = "Dfault environment for the Project."
}

variable "default_subnet_az" {
  type        = string
  default     = "us-east-1a"
  description = "Default Ec2 subnets Az´s."
}


# ===================
# Provider Variables
# ====================




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
# EC2 Variables
# ======================================


variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Default Ec2 instance type for Lab Machines."
}
