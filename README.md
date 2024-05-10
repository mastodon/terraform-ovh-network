# terraform-ovh-network

Module to create a private virtual network in OVH's public cloud.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ovh"></a> [ovh](#provider\_ovh) | 0.44.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ovh_cloud_project_gateway.gateway](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_gateway) | resource |
| [ovh_cloud_project_network_private.net](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_network_private) | resource |
| [ovh_cloud_project_network_private_subnet.subnet](https://registry.terraform.io/providers/ovh/ovh/latest/docs/resources/cloud_project_network_private_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_cidr"></a> [network\_cidr](#input\_network\_cidr) | Subnet to assign to the private network. | `string` | n/a | yes |
| <a name="input_network_gateway_model"></a> [network\_gateway\_model](#input\_network\_gateway\_model) | Size of the gateway to use for the private network. | `string` | `"s"` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name to give the private network. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | The ID of the Public Cloud project the resources will be created in. | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Region in which to create the various resources. | `string` | `"DE1"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the private network created. |
| <a name="output_name"></a> [name](#output\_name) | Name of the private network created. |
| <a name="output_vlan_id"></a> [vlan\_id](#output\_vlan\_id) | VLAN ID of the private network created. |
