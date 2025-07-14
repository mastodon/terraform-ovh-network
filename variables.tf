variable "project_id" {
  description = "The ID of the Public Cloud project the resources will be created in."
  type        = string
}

variable "vlan_id" {
  description = "VLAN ID to assign to this network."
  type        = number
  default     = 0
}

variable "region" {
  description = "Region(s) in which to create the various resources."
  type        = string
  default     = "DE1"
}

variable "network_name" {
  description = "Name to give the private network."
  type        = string
}

variable "network_cidr" {
  description = "Subnet to assign to the private network."
  type        = string
}

variable "network_gateway_model" {
  description = "Size of the gateway to use for the private network."
  type        = string
  default     = "s"

  validation {
    condition     = contains(["s", "m", "l"], var.network_gateway_model)
    error_message = "Valid values for network_gateway_model are (s, m, l)"
  }
}

variable "network_gateway_region" {
  description = "Specific region for the gateway. If none is given, takes the first region given in 'regions'"
  type        = string
  default     = ""
}
