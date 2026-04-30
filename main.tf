
# ==========================
#       === Modules Definition ===
# ==========================

# ---- VPC ----
# aws_vpc.main -> aws_subnet.public -> data.
module "vpc" {
  source          = "./modules/vpc"
  vpc_environment = local.common_tags.environment
  vpc_name        = "${local.resource_prefix} - Main VPC"
  vpc_cidr        = "10.0.0.0/16"

  availability_zones  = [var.vpc_az, "us-east-1b"]
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr = "10.0.3.0/24"
}


# ==========================
#       === EC2 ===
# ==========================


# resource "aws_instance" "ubuntu_web" {
#   ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
#   instance_type = "t3.micro"
#   primary_network_interface {
#     network_interface_id = aws_network_interface.ia_tf_main_n_interface.id
#   }

#   tags = {
#     Name = "${local.resource_prefix} - Netflix-00"
#   }
# }

