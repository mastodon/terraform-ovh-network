locals {
  gateway_name = "${var.network_name}-gateway"

  subnet_mask = split("/", var.network_cidr)[1]
}

resource "ovh_cloud_network_private_vrack" "net" {
  service_name = var.project_id
  vlan_id      = var.vlan_id
  name         = var.network_name
  region       = var.region
}

resource "ovh_cloud_network_private_vrack_subnet" "subnet" {
  service_name = var.project_id
  network_id   = ovh_cloud_network_private_vrack.net.id
  name         = var.subnet_name
  description  = var.network_description

  region       = var.region
  cidr         = var.network_cidr
  dhcp_enabled = true

  dns_nameservers = length(var.dns_nameservers) > 0 ? var.dns_nameservers : null

  allocation_pools = var.network_start != "" ? [{
    start = var.network_start
    end   = var.network_end
  }] : null

  depends_on = [ovh_cloud_network_private_vrack.net]
}

resource "ovh_cloud_gateway" "gateway" {
  service_name = var.project_id
  name         = local.gateway_name
  region       = var.region
  description  = var.network_gateway_description != "" ? var.network_gateway_description : null

  external_gateway = {
    enabled = true
    model   = var.network_gateway_model
  }

  subnet_ids = [ovh_cloud_network_private_vrack_subnet.subnet.id]
}
