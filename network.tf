locals {
  gateway_name = "${var.network_name}-gateway"

  subnet_name  = var.subnet_name != "" ? var.subnet_name : "subnet-${var.network_name}"
  subnet_mask  = split("/", var.network_cidr)[1]
  subnet_start = var.network_start != null ? var.network_start : cidrhost(var.network_cidr, 2)
  subnet_end   = var.network_end != null ? var.network_end : cidrhost(var.network_cidr, pow(2, (32 - local.subnet_mask)) - 2)
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
  name         = local.subnet_name

  region       = var.region
  cidr         = var.network_cidr
  dhcp_enabled = true

  allocation_pools = [{
    start = local.subnet_start
    end   = local.subnet_end
  }]

  depends_on = [ovh_cloud_network_private_vrack.net]
}

resource "ovh_cloud_gateway" "gateway" {
  service_name = var.project_id
  name         = local.gateway_name
  region       = var.region

  external_gateway = {
    enabled = true
    model   = var.network_gateway_model
  }

  subnet_ids = [ovh_cloud_network_private_vrack_subnet.subnet.id]
}
