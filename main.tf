//--------------------------------------------------------------------
// Modules
variable "organization" {}
variable "cluster_name" {}
variable "hashistack_ami" {
  default = "ami-0feeb6ce210f8861b"
}

module "nomad" {
  source  = "app.terraform.io/Darnold-Pipeline/nomad/aws"
  version = "2.0.0"
  bastion_image_id = "${var.hashistack_ami}"
  consul_image_id = "${var.hashistack_ami}"
  consul_public = "true"
  consul_servers = 3
  name = "${var.cluster_name}"
  nomad_client_docker_install = "true"
  nomad_client_java_install = "true"
  nomad_image_id = "${var.hashistack_ami}"
  nomad_public = "true"
  nomad_servers = 3
  nomad_clients = 3
  organization_name = "${var.organization}"
  common_name = "${var.common_name}"
  vault_provision = "true"
  vault_public = "true"
  vault_servers = 3
  vault_image_id = "${var.hashistack_ami}"
}

resource "random_id" "random" {
  keepers {
    uuid = "${uuid()}"
  }
  byte_length = 32
}
  
output "zREADME" {
  value = "${module.nomad.zREADME}"
}
  
output "private_key_pem" {
  value = "${module.nomad.private_key_pem}"
}
