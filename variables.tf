variable "alerting_enabled" {
  type    = bool
  default = true
}

variable "enabled" {
  type    = bool
  default = true
}

variable "notification_channel" {
  type    = string
  default = ""
}

variable "name" {
  type = string
}

variable "service" {
  type = string
}

variable "service_display_name" {
  type    = string
  default = null
}

variable "query" {
  type = string
}

variable "alert_message" {
  type = string
}

variable "recovery_message" {
  type    = string
  default = ""
}

variable "note" {
  type    = string
  default = ""
}

variable "docs" {
  type    = string
  default = ""
}

variable "env" {
  type = string
}

variable "additional_tags" {
  type    = list(string)
  default = []
}

variable "require_full_window" {
  type    = bool
  default = true
}

variable "critical_threshold" {
  type    = number
  default = null
}

variable "warning_threshold" {
  type    = number
  default = null
}

variable "ok_threshold" {
  type    = number
  default = null
}

variable "type" {
  type    = string
  default = "metric alert"

  validation {
    error_message = "Unknown datadog monitor type. See https://docs.datadoghq.com/api/latest/monitors/#create-a-monitor for monitor types."
    condition = contains(
      [
        "query alert",
        "query alert",
        "trace-analytics alert",
        "composite",
        "service check",
        "event alert",
        "query alert",
        "service check",
        "query alert",
        "service check",
        "process alert",
        "log alert",
        "metric alert",
        "service check",
        "query alert",
        "service check",
        "rum alert",
        "event alert",
        "event-v2 alert"
      ],
      var.type
    )
  }
}

variable "no_data_timeframe" {
  type    = number
  default = null
}

variable "notify_no_data" {
  type    = bool
  default = false
}

variable "locked" {
  type        = bool
  default     = true
  description = "Makes sure only the creator or admin can modify the monitor"
}

variable "name_prefix" {
  type        = string
  default     = ""
  description = "Can be used to prefix to the Monitor name"
}

variable "name_suffix" {
  type        = string
  default     = ""
  description = "Can be used to suffix to the Monitor name"
}

variable "priority" {
  description = "Number from 1 (high) to 5 (low)."

  type    = number
  default = null
}

variable "auto_resolve_time_h" {
  description = "Time of hours after which a triggered monitor that receives no data is automatically resolved."

  type    = number
  default = null
}

variable "custom_message" {
  description = "This field give the option to put in custom text. Both 'note' and 'docs' are prefixed in the template with 'note:' and 'docs:' respectively. 'custom_message' allows for free format"
  type        = string
  default     = ""
}

variable "anomaly_trigger_window" {
  description = "trigger_window value, e.g. last_15m Can only be used for anomaly monitors. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor#nested-schema-for-monitor_threshold_windows"
  default     = null
}

variable "anomaly_recovery_window" {
  description = "recovery_window value, e.g. last_15m Can only be used for anomaly monitors. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor#nested-schema-for-monitor_threshold_windows"
  default     = null
}

variable "new_group_delay" {
  description = "Time (in seconds) to skip evaluations for new groups. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor"
  type        = number
  default     = null
}