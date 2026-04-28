
# ==========================
# Providers
# ==========================


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
}

# ==========================
# Remote Profile Setup
# ==========================

provider "aws" {
  region  = local.default_region
  profile = local.aws_profile
  default_tags {
    tags = local.common_tags
  }
}

# ================================================
# Docs - Learn - TF config
# ================================================

# - [https://developer.hashicorp.com/terraform/plugin/log/managing]
