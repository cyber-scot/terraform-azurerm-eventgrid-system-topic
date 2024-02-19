output "eventgrid_identities" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.identity }
  description = "Map of the Event Grid identity blocks"
}

output "eventgrid_ids" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.id }
  description = "Map of Event Grid IDs"
}

output "eventgrid_locations" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.location }
  description = "Map of locations for each Event Grid system topic"
}

output "eventgrid_names" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.name }
  description = "Map of Event Grid names"
}

output "eventgrid_resource_group_names" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.resource_group_name }
  description = "Map of resource group names for each Event Grid system topic"
}

output "eventgrid_tags" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.tags }
  description = "Map of tags for each Event Grid system topic"
}

output "source_arm_resource_ids" {
  value       = { for k, v in azurerm_eventgrid_system_topic.eventgrid_system_topic : k => v.source_arm_resource_id }
  description = "Map of the Event Grid source ARM resource IDs"
}
