variable "alerting_enabled" {
  description = "If set to false no alerts will be sent based on this monitor"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "If set to false the monitor resource will not be created"
  type        = bool
  default     = true
}

variable "notification_channel" {
  description = "Channel to which datadog sends alerts, will be overridden by alerting_enabled if that's set to false"
  type        = string
  default     = ""
}

variable "name" {
  description = "Name that the monitor should get. Will be automatically prefixed with the Service name. Also name_suffix and name_prefix have an effect on the eventual name. It's best set this property to a value that best describes the concern you're trying to cover with the monitor. Eg. Connection Available"
  type        = string
}

variable "service" {
  description = "Service name of what you're monitoring. This also sets the service:<service> tag on the monitor"
  type        = string
}

variable "service_display_name" {
  type    = string
  default = null
}

variable "query" {
  description = "Query that's based on a metric to be used to raise an alert"
  type        = string
}

variable "alert_message" {
  description = "Message to be sent when the alert threshold is hit"
  type        = string
}

variable "recovery_message" {
  description = "Recovery message to be sent when the alert threshold is no longer hit"
  type        = string
  default     = ""
}

variable "no_data_message" {
  description = "Message to be sent when the monitor is no longer receiving data"
  type        = string
  default     = ""
}

variable "note" {
  description = "Field in the alert message that can be used to bring something to the attention of the engineer handling the alert"
  type        = string
  default     = ""
}

variable "docs" {
  description = "Field in the alert message that can be used to document why the alert was sent or what to do. It's best to include links to authoritative resources about what's being monitored. Try to capture why and what the engineer should do with this message"
  type        = string
  default     = ""
}

variable "env" {
  description = "This refers to the environment or which stage of deployment this monitor is checking. Good values are prd, acc, tst, dev..."
  type        = string
}

variable "additional_tags" {
  description = "Additional tags to set on the monitor. Good tagging can be hard but very useful to make cross sections of the environment. Datadog has a few default tags. https://docs.datadoghq.com/getting_started/tagging/ is a good place to start reading about tags"
  type        = list(string)
  default     = []
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

variable "critical_recovery" {
  type    = number
  default = null
}

variable "warning_recovery" {
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
        "event-v2 alert",
        "slo alert",
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
  description = "Do you want an alert when the monitoring stops sending data?"
  type        = bool
  default     = false
}

variable "locked" {
  description = "Makes sure only the creator or admin can modify the monitor"
  type        = bool
  default     = true
}

variable "name_prefix" {
  description = "Can be used to prefix to the Monitor name"
  type        = string
  default     = ""
}

variable "name_suffix" {
  description = "Can be used to suffix to the Monitor name"
  type        = string
  default     = ""
}

variable "priority" {
  description = "Number from 1 (high) to 5 (low)."
  type        = number
}

variable "auto_resolve_time_h" {
  description = "Time of hours after which a triggered monitor that receives no data is automatically resolved."
  type        = number
  default     = null
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