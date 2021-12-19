resource "aws_eip_association" "main_ec2_eip_assoc" {
  instance_id = aws_instance.main_ec2.id
  public_ip   = local.main_ec2_eip
}

