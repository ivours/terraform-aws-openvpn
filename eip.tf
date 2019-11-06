resource "aws_eip" "openvpn" {
  count    = var.az_count
  vpc      = true
  instance = aws_instance.openvpn[count.index].id
  tags = {
    Name = "${var.environment}-${var.namespace}-openvpn-${var.availability_zones[count.index]}-eip"
  }
}
