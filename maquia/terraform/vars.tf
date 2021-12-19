# =================================================================
# Main Settings
# =================================================================
variable "RBBS_BR_profile" { type = string }
variable "RBBS_BR_region" { type = string }
variable "RBBS_BR_bucket" { type = string }
variable "RBBS_BR_default_vpc_id" { type = string }
variable "RBBS_BR_default_vpc_cidr" { type = string }
variable "RBBS_BR_tag_name" { type = string }
variable "RBBS_BR_tag_owner" { type = string }
variable "RBBS_BR_tag_family" { type = string }


# =================================================================
# Main EC2 Settings
# =================================================================
variable "RBBS_BR_instance_name" { type = string }
variable "RBBS_BR_ami_id" { type = string }
variable "RBBS_BR_instance_type" { type = string }
variable "RBBS_BR_key_name" { type = string }
# Root Block Device
variable "RBBS_BR_rbd_volume_size" { type = string }
variable "RBBS_BR_rbd_volume_type" { type = string }

data "template_file" "main_ec2_user_data" { template = file("${path.module}/artifacts/startup.sh") }


# =================================================================
# Main EC2 EIP Association
# =================================================================
variable "RBBS_BR_eip" { type = string }


# =================================================================
# Main EC2 Security Group
# =================================================================
variable "RBBS_BR_whitelist_ip_open_cidr" { type = list(string) }
variable "RBBS_BR_whitelist_ip_open_sg" { type = list(string) }
variable "RBBS_BR_whitelist_vpc_cidr" { type = list(string) }
variable "RBBS_BR_whitelist_open_cidr_blocks" { type = list(string) }
variable "RBBS_BR_whitelist_open_cidr_blocks_ipv6" { type = list(string) }


