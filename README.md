# terraform-azure-load-balancer

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurecaf"></a> [azurecaf](#requirement\_azurecaf) | 2.0.0-preview3 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | > 4.10 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurecaf"></a> [azurecaf](#provider\_azurecaf) | 2.0.0-preview3 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | > 4.10 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_lb.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb) | resource |
| [azurerm_lb_backend_address_pool.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_backend_address_pool) | resource |
| [azurerm_lb_nat_rule.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_nat_rule) | resource |
| [azurerm_lb_probe.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_probe) | resource |
| [azurerm_lb_rule.azlb](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/lb_rule) | resource |
| [azurerm_public_ip.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurecaf_name.load_balancer](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/data-sources/name) | data source |
| [azurecaf_name.load_balancer_backend_address_pool](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/data-sources/name) | data source |
| [azurecaf_name.public_ip](https://registry.terraform.io/providers/aztfmod/azurecaf/2.0.0-preview3/docs/data-sources/name) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lb_disable_outbound_snat"></a> [lb\_disable\_outbound\_snat](#input\_lb\_disable\_outbound\_snat) | Disable outbound SNAT for the Load Balancer. | `bool` | `false` | no |
| <a name="input_lb_edge_zone"></a> [lb\_edge\_zone](#input\_lb\_edge\_zone) | The Edge Zone of the Load Balancer. | `string` | `null` | no |
| <a name="input_lb_floating_ip_enabled"></a> [lb\_floating\_ip\_enabled](#input\_lb\_floating\_ip\_enabled) | Enable floating IP for the Load Balancer. | `bool` | `false` | no |
| <a name="input_lb_frontend_frontend_ip_zones"></a> [lb\_frontend\_frontend\_ip\_zones](#input\_lb\_frontend\_frontend\_ip\_zones) | The availability zones of the frontend IP configuration. | `list(string)` | `null` | no |
| <a name="input_lb_frontend_name"></a> [lb\_frontend\_name](#input\_lb\_frontend\_name) | The name of the frontend IP configuration. | `string` | `"frontend"` | no |
| <a name="input_lb_frontend_private_ip_address"></a> [lb\_frontend\_private\_ip\_address](#input\_lb\_frontend\_private\_ip\_address) | The private IP address of the frontend IP configuration. | `string` | `null` | no |
| <a name="input_lb_frontend_private_ip_address_allocation"></a> [lb\_frontend\_private\_ip\_address\_allocation](#input\_lb\_frontend\_private\_ip\_address\_allocation) | The private IP address allocation method of the frontend IP configuration. | `string` | `"Dynamic"` | no |
| <a name="input_lb_frontend_private_ip_address_version"></a> [lb\_frontend\_private\_ip\_address\_version](#input\_lb\_frontend\_private\_ip\_address\_version) | The private IP address version of the frontend IP configuration. | `string` | `"IPv4"` | no |
| <a name="input_lb_frontend_private_subnet_id"></a> [lb\_frontend\_private\_subnet\_id](#input\_lb\_frontend\_private\_subnet\_id) | The subnet ID of the frontend IP configuration. | `string` | `null` | no |
| <a name="input_lb_nat_remote_port"></a> [lb\_nat\_remote\_port](#input\_lb\_nat\_remote\_port) | The remote port of the NAT rule. [protocol, backend\_port].  Frontend port will be automatically generated starting at 50000 and in the output. | `map(any)` | `{}` | no |
| <a name="input_lb_port"></a> [lb\_port](#input\_lb\_port) | The port settings for the Load Balancer. | `map(any)` | `{}` | no |
| <a name="input_lb_probe"></a> [lb\_probe](#input\_lb\_probe) | The probe settings for the Load Balancer. | `map(any)` | `{}` | no |
| <a name="input_lb_probe_interval"></a> [lb\_probe\_interval](#input\_lb\_probe\_interval) | The interval of the probe. | `number` | `5` | no |
| <a name="input_lb_probe_unhealthy_threshold"></a> [lb\_probe\_unhealthy\_threshold](#input\_lb\_probe\_unhealthy\_threshold) | The unhealthy threshold of the probe. | `number` | `3` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | The SKU of the Load Balancer. | `string` | `"Standard"` | no |
| <a name="input_lb_sku_tier"></a> [lb\_sku\_tier](#input\_lb\_sku\_tier) | The Tier of the Load Balancer SKU. | `string` | `"Regional"` | no |
| <a name="input_lb_stack"></a> [lb\_stack](#input\_lb\_stack) | The stack name to use for the load balancer. | `string` | n/a | yes |
| <a name="input_lb_tags"></a> [lb\_tags](#input\_lb\_tags) | The tags to associate with the Load Balancer. | `map(string)` | `{}` | no |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | The type of load balancer to create. | `string` | `"private"` | no |
| <a name="input_location"></a> [location](#input\_location) | The location/region where the resources will be created. | `string` | n/a | yes |
| <a name="input_prefixes"></a> [prefixes](#input\_prefixes) | The prefixes to use for the naming convention. | `list(string)` | `[]` | no |
| <a name="input_public_ip_allocation_method"></a> [public\_ip\_allocation\_method](#input\_public\_ip\_allocation\_method) | The allocation method for the public IP address. | `string` | `"Static"` | no |
| <a name="input_public_ip_ddos_protection_mode"></a> [public\_ip\_ddos\_protection\_mode](#input\_public\_ip\_ddos\_protection\_mode) | The DDoS protection mode of the Public IP. | `string` | `"Disabled"` | no |
| <a name="input_public_ip_ddos_protection_plan_id"></a> [public\_ip\_ddos\_protection\_plan\_id](#input\_public\_ip\_ddos\_protection\_plan\_id) | The DDoS protection plan ID of the Public IP. | `string` | `null` | no |
| <a name="input_public_ip_edge_zone"></a> [public\_ip\_edge\_zone](#input\_public\_ip\_edge\_zone) | The Edge Zone of the Public IP. | `string` | `null` | no |
| <a name="input_public_ip_idle_timeout_in_minutes"></a> [public\_ip\_idle\_timeout\_in\_minutes](#input\_public\_ip\_idle\_timeout\_in\_minutes) | The idle timeout in minutes of the Public IP. | `number` | `4` | no |
| <a name="input_public_ip_ip_version"></a> [public\_ip\_ip\_version](#input\_public\_ip\_ip\_version) | The IP version of the Public IP. | `string` | `"IPv4"` | no |
| <a name="input_public_ip_public_ip_prefix_id"></a> [public\_ip\_public\_ip\_prefix\_id](#input\_public\_ip\_public\_ip\_prefix\_id) | The Public IP Prefix ID of the Public IP. | `string` | `null` | no |
| <a name="input_public_ip_reverse_fqdn"></a> [public\_ip\_reverse\_fqdn](#input\_public\_ip\_reverse\_fqdn) | The reverse FQDN of the Public IP. | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | The SKU of the Public IP. | `string` | `"Standard"` | no |
| <a name="input_public_ip_sku_tier"></a> [public\_ip\_sku\_tier](#input\_public\_ip\_sku\_tier) | The Tier of the Public IP SKU. | `string` | `"Regional"` | no |
| <a name="input_public_ip_stack"></a> [public\_ip\_stack](#input\_public\_ip\_stack) | The stack name to use for the public IP. | `string` | n/a | yes |
| <a name="input_public_ip_tags"></a> [public\_ip\_tags](#input\_public\_ip\_tags) | The tags to associate with the Public IP. | `map(string)` | `{}` | no |
| <a name="input_public_ip_zones"></a> [public\_ip\_zones](#input\_public\_ip\_zones) | The availability zones of the Public IP. | `list(string)` | <pre>[<br/>  "1",<br/>  "2",<br/>  "3"<br/>]</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the resource group in which the resources will be created. | `string` | n/a | yes |
| <a name="input_suffixes"></a> [suffixes](#input\_suffixes) | The suffixes to use for the naming convention. | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_load_balancer_backend_address_pool_id"></a> [load\_balancer\_backend\_address\_pool\_id](#output\_load\_balancer\_backend\_address\_pool\_id) | The ID of the Load Balancer Backend Address Pool |
| <a name="output_load_balancer_frontend_ip_configuration"></a> [load\_balancer\_frontend\_ip\_configuration](#output\_load\_balancer\_frontend\_ip\_configuration) | The Frontend IP Configuration of the Load Balancer |
| <a name="output_load_balancer_id"></a> [load\_balancer\_id](#output\_load\_balancer\_id) | The ID of the Load Balancer |
| <a name="output_load_balancer_name"></a> [load\_balancer\_name](#output\_load\_balancer\_name) | The Name of the Load Balancer |
| <a name="output_load_balancer_nat_rule_ids"></a> [load\_balancer\_nat\_rule\_ids](#output\_load\_balancer\_nat\_rule\_ids) | The IDs of the Load Balancer NAT Rules |
| <a name="output_load_balancer_probe_ids"></a> [load\_balancer\_probe\_ids](#output\_load\_balancer\_probe\_ids) | The IDs of the Load Balancer Probes |
| <a name="output_public_ip_address"></a> [public\_ip\_address](#output\_public\_ip\_address) | The Public IP Address |
| <a name="output_public_ip_id"></a> [public\_ip\_id](#output\_public\_ip\_id) | The ID of the Public IP Address |
<!-- END_TF_DOCS -->