output "id" {
  description = "ID of the private network created."
  value       = ovh_cloud_project_network_private.net.id
}

output "name" {
  description = "Name of the private network created."
  value       = ovh_cloud_project_network_private.net.name
}

output "vlan_id" {
  description = "VLAN ID of the private network created."
  value       = ovh_cloud_project_network_private.net.vlan_id
}
