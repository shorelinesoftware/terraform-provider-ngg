# Defines the required Nvidia GPU Guardian provider and version
terraform {
  required_providers {
    ngg = {
      source  = "nvidia/ngg"
      version = ">= 1.0.7"
    }
  }
}

# Set provider-specific arguments
provider "ngg" {
  url = "<CLUSTER_API_ENDPOINT>"
}

# Create an Alarm that fires when host CPU usage exceeds 35% for 48 of the previous 60 seconds.
# This Alarm clears when CPU usage is below 35% for the previous 180 seconds.
resource "ngg_alarm" "high_cpu_alarm" {
  name                   = "high_cpu_alarm"
  fire_query             = "(cpu_usage > 35 | sum(60)) >= 48"
  clear_query            = "(cpu_usage < 35 | sum(180)) >= 180"
  description            = "Watch CPU usage."
  resource_query         = "hosts"
  enabled                = true
  resolve_short_template = "high_cpu_alarm resolved"
}

# Create an Action that executes a Linux command to count the active background jobs.
resource "ngg_action" "background_jobs_action" {
  name                    = "background_jobs_action"
  command                 = "`top -b -n 1 | head -n 15`"
  description             = "Count background jobs"
  start_title_template    = "background_jobs_action started"
  complete_title_template = "background_jobs_action completed"
  error_title_template    = "background_jobs_action failed"
  enabled                 = true
}

# Create a Bot that triggers the 'background_jobs_action' when the 'high_cpu_alarm' fires.
resource "ngg_bot" "cpu_bot" {
  name        = "cpu_bot"
  command     = "if ${ngg_alarm.high_cpu_alarm.name} then ${ngg_action.background_jobs_action.name} fi"
  description = "Count background jobs on high CPU usage."
  enabled     = true
}
