
resource "ngg_bot" "full_bot" {
  name                    = "full_bot"
  command                 = "if ${var.full_alarm_name} then ${var.full_action_name}('/tmp') fi"
  description             = "<description>"
  event_type              = "NGG"
  monitor_id              = "<external_trigger_id>"
  alarm_resource_query    = "host"
  communication_workspace = "<communication_workspace>"
  communication_channel   = "<communication_channel>"
  integration_name        = "<integration_name>"
  enabled                 = true
}


resource "ngg_bot" "minimal_bot" {
  name    = "minimal_bot"
  command = "if ${var.minimal_alarm_name} then ${var.minimal_action_name} fi"
}


resource "ngg_bot" "full_time_trigger_bot" {
  name                    = "full_time_trigger_bot"
  command                 = "if ${var.full_time_trigger_name} then ${var.full_runbook_name} fi"
  description             = "<description>"
  event_type              = "NGG"
  communication_workspace = "<communication_workspace>"
  communication_channel   = "<communication_channel>"
  enabled                 = true
}


resource "ngg_bot" "minimal_time_trigger_bot" {
  name    = "minimal_time_trigger_bot"
  command = "if ${var.minimal_time_trigger_name} then ${var.minimal_runbook_name} fi"
}
