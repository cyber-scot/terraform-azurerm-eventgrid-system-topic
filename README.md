```hcl
resource "azurerm_eventgrid_system_topic" "eventgrid_system_topic" {
  for_each               = { for k, v in var.eventgrids : k => v }
  name                   = each.value.name
  resource_group_name    = each.value.rg_name
  location               = each.value.location
  tags                   = each.value.tags
  source_arm_resource_id = each.value.source_arm_resource_id
  topic_type             = each.value.topic_type

  dynamic "identity" {
    for_each = each.value.identity_type == "SystemAssigned" ? [each.value.identity_type] : []
    content {
      type = each.value.identity_type
    }
  }

  dynamic "identity" {
    for_each = each.value.identity_type == "UserAssigned" ? [each.value.identity_type] : []
    content {
      type         = each.value.identity_type
      identity_ids = length(try(each.value.identity_ids, [])) > 0 ? each.value.identity_ids : []
    }
  }
}



```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_eventgrid_system_topic.eventgrid_system_topic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/eventgrid_system_topic) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_eventgrids"></a> [eventgrids](#input\_eventgrids) | The event grids blocks | <pre>list(object({<br>    name                      = string<br>    location                  = optional(string, "uksouth")<br>    rg_name                   = string<br>    create_event_subscription = optional(bool, false)<br>    tags                      = map(string)<br>    source_arm_resource_id    = string<br>    topic_type                = string<br>    identity_type             = optional(string)<br>    identity_ids              = optional(list(string))<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventgrid_identities"></a> [eventgrid\_identities](#output\_eventgrid\_identities) | Map of the Event Grid identity blocks |
| <a name="output_eventgrid_ids"></a> [eventgrid\_ids](#output\_eventgrid\_ids) | Map of Event Grid IDs |
| <a name="output_eventgrid_locations"></a> [eventgrid\_locations](#output\_eventgrid\_locations) | Map of locations for each Event Grid system topic |
| <a name="output_eventgrid_names"></a> [eventgrid\_names](#output\_eventgrid\_names) | Map of Event Grid names |
| <a name="output_eventgrid_resource_group_names"></a> [eventgrid\_resource\_group\_names](#output\_eventgrid\_resource\_group\_names) | Map of resource group names for each Event Grid system topic |
| <a name="output_eventgrid_tags"></a> [eventgrid\_tags](#output\_eventgrid\_tags) | Map of tags for each Event Grid system topic |
| <a name="output_source_arm_resource_ids"></a> [source\_arm\_resource\_ids](#output\_source\_arm\_resource\_ids) | Map of the Event Grid source ARM resource IDs |
