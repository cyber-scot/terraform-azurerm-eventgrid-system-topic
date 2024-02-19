variable "eventgrids" {
  description = "The event grids blocks"
  default     = null
  type = list(object({
    name                         = string
    location                     = optional(string, "uksouth")
    rg_name                      = string
    create_event_subscription    = optional(bool, false)
    tags                         = map(string)
    source_arm_resource_id       = string
    topic_type                   = string
    identity_type                = optional(string)
    identity_ids                 = optional(list(string))
  }))
}
