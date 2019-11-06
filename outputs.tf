output "openvpn_ec2_cidr_blocks" {
  value = "${formatlist("%v/32", aws_instance.openvpn.*.private_ip)}"
}

output "openvpn_ec2_eni_id" {
  value = aws_instance.openvpn.*.primary_network_interface_id
}
