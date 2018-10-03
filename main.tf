//--------------------------------------------------------------------
// Modules
variable "organization" {}
variable "cluster_name" {}

module "nomad" {
  source  = "app.terraform.io/Darnold-Pipeline/nomad/aws"
  version = "2.0.0"

  consul_public = "true"
  consul_servers = 3
  name = "${var.cluster_name}"
  nomad_client_docker_install = "true"
  nomad_client_java_install = "true"
  nomad_public = "true"
  nomad_servers = 3
  organization_name = "${var.organization}"
  vault_provision = "true"
  vault_public = "true"
  vault_servers = 3
}
