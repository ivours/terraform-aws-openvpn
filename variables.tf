variable "az_count" {
  description = "Number of AZs where OpenVPN will be deployed"
}

variable "namespace" {
  description = "Namespace"
}

variable "environment" {
  description = "Environment to deploy. (e.g. `prod` `staging` `testing` `develop` `sandbox`)"
}

variable "team" {
  description = "Team owner of the resources. (e.g. `backend` `frontend` `billing`)"
}

variable "owner" {
  description = "User who is building the infrastructure. (e.g. `your@email.com` or `AutomationServiceAccount`)"
}

variable "availability_zones" {
  description = "Availability zones where the infrastructure will be deployed."
}

variable "openvpn_ami" {
  description = "ID of the AMI that will be used to deploy the openvpn EC2 instance."
}

variable "openvpn_key_pair_name" {}

variable "public_subnet_ids" {}

variable "vpc_id" {}
