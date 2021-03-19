# IMPORTANT
# This will be set as ENV variables
# example: export TF_VAR_var_name

/*
variable "gcp_auth_file" {
  description = ""
  type        = string
}
*/


variable "region" {
  description = "The region name you want to use for your projects"
  type        = string
  default     = "us-east1"
}

variable "project" {
  type = string
}

variable "listen_port" {
  description = "Port number on which Jenkins will listen"
  type = string
}

variable "machine_type" {
  description = "Machine H/W profile"
  type = string
}

variable "zone" {
  description = "Zone where we run machine"
  type = string
}


variable "os_image" {
  description = "OS Image to use for VM spin up"
  type = string
}

variable "vm_name_prefix" {
  description = "VM name prefix; is used for short hostname and/or declaring FQDN; exmple: vm_name_prefix = jenkins-master -> fqdn = jenkins-master.domain.com"
  type = string
}

variable "allowed_networks" {
  description = "List of networks to allow access to HTTP port"
  type = list
}
