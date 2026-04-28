
# ==========================
#       === VPC ===
# ==========================


# aws_vpc.main -> aws_subnet.public -> data.

resource "aws_vpc" "ia_tf_main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${local.resource_prefix} - main VPC"
  }
}

resource "aws_subnet" "default_private" {
  vpc_id            = aws_vpc.ia_tf_main.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = var.default_subnet_az

  tags = {
    Name = "${local.resource_prefix} - default private"
  }
}

resource "aws_network_interface" "ia_tf_main_n_interface" {
  subnet_id   = aws_subnet.default_private.id
  private_ips = ["10.0.0.100"]

  tags = {
    Name = "${local.resource_prefix} - main Network Interface"
  }
}


# ==========================
#       === EC2 ===
# ==========================


resource "aws_instance" "ubuntu_web" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
  instance_type = "t3.micro"
  primary_network_interface {
    network_interface_id = aws_network_interface.ia_tf_main_n_interface.id
  }

  tags = {
    Name = "${local.resource_prefix} - Netflix-00"
  }
}

