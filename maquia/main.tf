# =================================================================
# Project Variables
# =================================================================
locals {
  name           = var.RBBS_BR_instance_name
  region         = var.RBBS_BR_region
  profile        = var.RBBS_BR_profile
  default_vpc_id = var.RBBS_BR_default_vpc_id

  # Main EC2
  main_ec2_ami             = var.RBBS_BR_ami_id
  main_ec2_instance_type   = var.RBBS_BR_instance_type
  main_ec2_key_name        = var.RBBS_BR_key_name
  main_ec2_rbd_volume_size = var.RBBS_BR_rbd_volume_size
  main_ec2_rbd_volume_type = var.RBBS_BR_rbd_volume_type

# Main EC2: EIP Association
  main_ec2_eip = var.RBBS_BR_eip

  # Main EC2: Security Group
  main_ec2_sg_ssh                   = var.RBBS_BR_whitelist_ip_open_cidr
  main_ec2_sg_ssh_sgid              = var.RBBS_BR_whitelist_ip_open_sg
  main_ec2_sg_open_cidr_blocks      = var.RBBS_BR_whitelist_open_cidr_blocks
  main_ec2_sg_open_cidr_blocks_ipv6 = var.RBBS_BR_whitelist_open_cidr_blocks_ipv6

  tags = {
    Name   = "${var.RBBS_BR_tag_name}"
    Owner  = "${var.RBBS_BR_tag_owner}"
    Family = "${var.RBBS_BR_tag_family}"
  }
}

# =================================================================
# Main Settings
# =================================================================
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"

  # Contents stored at backend_s3.tfvars
  backend "s3" {}
}

provider "aws" {
  profile = local.profile
  region  = local.region
}

