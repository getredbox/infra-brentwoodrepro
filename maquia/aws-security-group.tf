resource "aws_security_group" "main_sg" {
  # name        = local.name
  description = "Settings for ${local.name}"
  vpc_id      = local.default_vpc_id

  # Main Security Rules
  ## Server secure Websites
  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = local.main_ec2_sg_open_cidr_blocks
  }

  ## Server Websites
  ingress {
    description = "Web Server 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = local.main_ec2_sg_open_cidr_blocks
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = local.main_ec2_sg_open_cidr_blocks
    ipv6_cidr_blocks = local.main_ec2_sg_open_cidr_blocks_ipv6
  }

  tags = local.tags

  # Custom Ingress Rules
  ## All Approved SSH
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = local.main_ec2_sg_ssh
  }

  ## Approved Security Groups
  ingress {
    description     = "SSH for Other Group IDs"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = local.main_ec2_sg_ssh_sgid
  }
}