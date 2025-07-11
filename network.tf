locals {
  gateway_name = "${var.network_name}-gateway"
  gateway_region = var.network_gateway_region ? var.network_gateway_region : var.regions[0]

  subnet_mask  = split("/", var.network_cidr)[1]
  subnet_start = cidrhost(var.network_cidr, 2)
  subnet_end   = cidrhost(var.network_cidr, pow(2, (32 - local.subnet_mask)) - 2)
}

resource "ovh_cloud_project_network_private" "net" {
  service_name = var.project_id
  name         = var.network_name
  regions      = var.regions
}

resource "ovh_cloud_project_network_private_subnet" "subnet" {
  service_name = var.project_id
  network_id   = ovh_cloud_project_network_private.net.id

  region  = var.regions
  start   = local.subnet_start
  end     = local.subnet_end
  network = var.network_cidr
  dhcp    = true

  depends_on = [ovh_cloud_project_network_private.net]
}

resource "ovh_cloud_project_gateway" "gateway" {
  service_name = var.project_id
  name         = local.gateway_name
  model        = var.network_gateway_model
  region       = var.regions
  network_id   = tolist(ovh_cloud_project_network_private.net.regions_attributes[*].openstackid)[0]
  subnet_id    = ovh_cloud_project_network_private_subnet.subnet.id
}
