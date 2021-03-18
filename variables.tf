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
  type    = string
}

variable "severity" {
  type    = string
  default = "major"
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
    condition     = contains(
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
