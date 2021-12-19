resource "aws_instance" "main_ec2" {
  ami                    = local.main_ec2_ami
  instance_type          = local.main_ec2_instance_type
  key_name               = local.main_ec2_key_name
  vpc_security_group_ids = [aws_security_group.main_sg.id]
  user_data              = data.template_file.main_ec2_user_data.rendered

  root_block_device {
    volume_size = local.main_ec2_rbd_volume_size
    volume_type = local.main_ec2_rbd_volume_type
    tags        = local.tags
  }

  tags = local.tags
}


