
locals {
  aws_profile = "126836804918_Trainning_colpe_AWS_DevOpsTeam"
}

locals {
  resource_prefix = "IA-TF"
}

locals {
  default_region = "us-east-1"
}

locals {
  common_tags = {
    academy     = "terraform202601"
    environment = var.default_environment
    owner       = "IA"
    managed_by  = "glober"
    studio      = "cloud"
  }
}