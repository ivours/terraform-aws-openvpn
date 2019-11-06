resource "aws_security_group" "openvpn" {
  name        = "openvpn-security-group"
  description = "OpenVPN Security Group"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "openvpn_udp_1194" {
  security_group_id = aws_security_group.openvpn.id
  type              = "ingress"
  from_port         = 1194
  to_port           = 1194
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "openvpn_tcp_945" {
  security_group_id = aws_security_group.openvpn.id
  type              = "ingress"
  from_port         = 945
  to_port           = 945
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "openvpn_tcp_943" {
  security_group_id = aws_security_group.openvpn.id
  type              = "ingress"
  from_port         = 943
  to_port           = 943
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "openvpn_tcp_443" {
  security_group_id = aws_security_group.openvpn.id
  type              = "ingress"
  description       = "Access to web server"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "openvpn_egress" {
  security_group_id = aws_security_group.openvpn.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
}

data "aws_instance" "openvpn" {
  count       = 1
  instance_id = aws_instance.openvpn[count.index].id
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  count                = 1
  security_group_id    = aws_security_group.openvpn.id
  network_interface_id = data.aws_instance.openvpn[count.index].network_interface_id
}
