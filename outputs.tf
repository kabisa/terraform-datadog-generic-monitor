output "alert_id" {
  value = var.enabled ? datadog_monitor.generic_datadog_monitor[0].id : null
}