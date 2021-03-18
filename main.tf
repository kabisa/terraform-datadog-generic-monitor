locals {
  notification_channel = var.alerting_enabled ? var.notification_channel : ""
}

resource "datadog_monitor" "toyota_datadog_monitor" {
  count = var.enabled ? 1 : 0
  name  = "${var.service} - ${var.name}"
  type  = var.type
  query = var.query

  message = templatefile("${path.module}/alert.tpl", {
    alert_message    = var.alert_message
    recovery_message = var.recovery_message

    note = var.note
    docs = var.docs

    notification_channel = local.notification_channel
  })

  tags = concat(
    [
      "terraform:true",
      "env:${var.env}",
      "service:${var.service}",
      "severity:${var.severity}",
    ],
    var.additional_tags
  )

  no_data_timeframe = var.no_data_timeframe
  notify_no_data    = var.notify_no_data

  require_full_window = var.require_full_window

  monitor_thresholds {
    critical = var.critical_threshold
    warning  = var.warning_threshold
    ok       = var.ok_threshold
  }

  locked = true
}
