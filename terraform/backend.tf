
# جلب الـ Default VPC
data "aws_vpc" "default" {
  default = true
}

# جلب الـ Subnets الخاصة بـ Default VPC
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

# جلب الـ Default Security Group
data "aws_security_group" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

# EC2 Instance رقم 1
resource "aws_instance" "backend_1" {
  ami                         = "ami-05772ccfda0e9b7d8" # AMI لـ Amazon Linux 2023 في us-east-1
  instance_type               = "t3.micro"
  key_name                    = "firstkey"
  subnet_id                   = data.aws_subnets.default.ids[0]
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.aws_security_group.default.id]

  tags = {
    Name = "Backend Instance 1"
  }
}

# EC2 Instance رقم 2
resource "aws_instance" "backend_2" {
  ami                         = "ami-05772ccfda0e9b7d8"
  instance_type               = "t3.micro"
  key_name                    = "firstkey"
  subnet_id                   = data.aws_subnets.default.ids[1]
  associate_public_ip_address = true
  vpc_security_group_ids      = [data.aws_security_group.default.id]

  tags = {
    Name = "Backend Instance 2"
  }
}