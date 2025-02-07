variable "namespace" {
  type        = string
  description = "A namespace to isolate multiple instances of the module with different parameters."
}

variable "resource_query" {
  type        = string
  description = "The set of hosts/pods/containers monitored and affected by this module."
}

variable "jvm_process_regex" {
  type        = string
  description = "A regular expression to match and select the monitored Java processes."
}

variable "mem_threshold" {
  type        = number
  description = "The high-water-mark, in Mb, above which the JVM process stack-trace is dumped."
  default     = 2000
}

variable "check_interval" {
  type        = number
  description = "Frequency, in seconds, to check the memory usage."
  default     = 60
}

variable "script_path" {
  type        = string
  description = "Destination (on selected resources) for the check, and stack-dump scripts."
  default     = "/agent/scripts"
}

variable "s3_bucket" {
  type        = string
  description = "Destination in AWS S3 for stack-dump output files."
  default     = "shore-oppack-test"
}
