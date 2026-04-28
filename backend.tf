# =========================
# Terraform Cloud Backend
# =========================


# terraform {
#   backend var.s3_bucket_name
#   key = var.s3_bucket_key
#   region = local.default_region
#   encrypt = true
#   use_lockfile = true
#   profile = local.aws_profile
# }