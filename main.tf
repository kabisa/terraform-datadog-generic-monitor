locals {
  notification_channel = var.alerting_enabled ? var.notification_channel : ""
  tag_specials_regex   = "/[^a-z0-9\\-_:.\\/]/"

  tags = concat(
    [
      "terraform:true",
      "env:${var.env}",
      "service:${var.service}",
    ],
    var.additional_tags
  )

  # Normalize all the tags according to best practices defined by Datadog. The
  # following changes are made:
  #
  # * Make all characters lowercase.
  # * Replace special characters with an underscore.
  # * Remove duplicate underscores.
  # * Remove any non-letter leading characters.
  # * Remove any trailing underscores.
  #
  # See: https://docs.datadoghq.com/developers/guide/what-best-practices-are-recommended-for-naming-metrics-and-tags
  normalized_tags = [
    for tag
    in local.tags :
    replace(
      replace(
        replace(
          replace(lower(tag), local.tag_specials_regex, "_")
          ,
          "/_+/",
          "_"
        ),
        "/^[^a-z]+/",
        ""
      ),
      "/_+$/",
      ""
    )
  ]
}

resource "datadog_monitor" "generic_datadog_monitor" {
  count = var.enabled ? 1 : 0
  name = join(" - ", compact([
    var.name_prefix,
    var.service,
    var.name,
    var.name_suffix
  ]))
  type  = var.type
  query = var.query

  message = templatefile("${path.module}/alert.tpl", {
    alert_message    = var.alert_message
    recovery_message = var.recovery_message

    note           = var.note
    docs           = var.docs
    custom_message = var.custom_message

    notification_channel = local.notification_channel
  })

  tags     = local.normalized_tags
  priority = var.priority

  no_data_timeframe = var.no_data_timeframe
  notify_no_data    = var.notify_no_data
  timeout_h         = var.auto_resolve_time_h

  require_full_window = var.require_full_window

  monitor_thresholds {
    critical = var.critical_threshold
    warning  = var.warning_threshold
    ok       = var.ok_threshold
  }

  monitor_threshold_windows {
    recovery_window = var.anomaly_recovery_window
    trigger_window  = var.anomaly_trigger_window
  }

  new_host_delay = var.new_group_delay

  locked = var.locked

  # We don't want to manage muted alerts in Terraform.
  lifecycle {
    ignore_changes = [
      silenced
    ]
  }
}
