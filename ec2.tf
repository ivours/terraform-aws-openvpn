resource "aws_instance" "openvpn" {
  count                   = var.az_count
  ami                     = var.openvpn_ami
  instance_type           = "t2.micro"
  subnet_id               = var.public_subnet_ids[count.index]
  key_name                = var.openvpn_key_pair_name
  disable_api_termination = true
  source_dest_check       = false
  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 100
    volume_size           = 8
    volume_type           = "gp2"
  }
  tags = {
    Name        = "${var.environment}-${var.namespace}-openvpn-${var.availability_zones[count.index]}-ec2"
    Description = "OpenVPN server"
    AZ          = var.availability_zones[count.index]
  }
}
