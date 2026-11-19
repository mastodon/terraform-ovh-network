output "id" {
  description = "ID of the private network created."
  value       = ovh_cloud_network_private_vrack.net.id
}

output "name" {
  description = "Name of the private network created."
  value       = ovh_cloud_network_private_vrack.net.current_state.name
}

output "vlan_id" {
  description = "VLAN ID of the private network created."
  value       = ovh_cloud_network_private_vrack.net.current_state.vlan_id
}

output "subnet_id" {
  description = "ID of the private subnet created."
  value       = ovh_cloud_network_private_vrack_subnet.subnet.id
}

output "subnet_name" {
  description = "Name of the private subnet created."
  value       = ovh_cloud_network_private_vrack_subnet.subnet.current_state.name
}
