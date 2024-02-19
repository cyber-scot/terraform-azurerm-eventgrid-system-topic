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



