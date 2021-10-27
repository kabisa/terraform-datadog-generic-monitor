# terraform-datadog-generic-monitor

This module is a base module for most of our datadog alerts.
A good example use can be found [here](https://github.com/kabisa/terraform-datadog-system)

## Getting Started

Pre-commit:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you clone a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~> 2.21 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_datadog"></a> [datadog](#provider\_datadog) | 2.26.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [datadog_monitor.generic_datadog_monitor](https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | n/a | `list(string)` | `[]` | no |
| <a name="input_alert_message"></a> [alert\_message](#input\_alert\_message) | n/a | `string` | n/a | yes |
| <a name="input_alerting_enabled"></a> [alerting\_enabled](#input\_alerting\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_anomaly_recovery_window"></a> [anomaly\_recovery\_window](#input\_anomaly\_recovery\_window) | recovery\_window value, e.g. last\_15m Can only be used for anomaly monitors. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor#nested-schema-for-monitor_threshold_windows | `any` | `null` | no |
| <a name="input_anomaly_trigger_window"></a> [anomaly\_trigger\_window](#input\_anomaly\_trigger\_window) | trigger\_window value, e.g. last\_15m Can only be used for anomaly monitors. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor#nested-schema-for-monitor_threshold_windows | `any` | `null` | no |
| <a name="input_auto_resolve_time_h"></a> [auto\_resolve\_time\_h](#input\_auto\_resolve\_time\_h) | Time of hours after which a triggered monitor that receives no data is automatically resolved. | `number` | `null` | no |
| <a name="input_critical_threshold"></a> [critical\_threshold](#input\_critical\_threshold) | n/a | `number` | `null` | no |
| <a name="input_custom_message"></a> [custom\_message](#input\_custom\_message) | This field give the option to put in custom text. Both 'note' and 'docs' are prefixed in the template with 'note:' and 'docs:' respectively. 'custom\_message' allows for free format | `string` | `""` | no |
| <a name="input_docs"></a> [docs](#input\_docs) | n/a | `string` | `""` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | n/a | yes |
| <a name="input_locked"></a> [locked](#input\_locked) | Makes sure only the creator or admin can modify the monitor | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Can be used to prefix to the Monitor name | `string` | `""` | no |
| <a name="input_name_suffix"></a> [name\_suffix](#input\_name\_suffix) | Can be used to suffix to the Monitor name | `string` | `""` | no |
| <a name="input_new_group_delay"></a> [new\_group\_delay](#input\_new\_group\_delay) | Time (in seconds) to skip evaluations for new groups. https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor | `number` | `null` | no |
| <a name="input_no_data_timeframe"></a> [no\_data\_timeframe](#input\_no\_data\_timeframe) | n/a | `number` | `null` | no |
| <a name="input_note"></a> [note](#input\_note) | n/a | `string` | `""` | no |
| <a name="input_notification_channel"></a> [notification\_channel](#input\_notification\_channel) | n/a | `string` | `""` | no |
| <a name="input_notify_no_data"></a> [notify\_no\_data](#input\_notify\_no\_data) | n/a | `bool` | `false` | no |
| <a name="input_ok_threshold"></a> [ok\_threshold](#input\_ok\_threshold) | n/a | `number` | `null` | no |
| <a name="input_priority"></a> [priority](#input\_priority) | Number from 1 (high) to 5 (low). | `number` | `null` | no |
| <a name="input_query"></a> [query](#input\_query) | n/a | `string` | n/a | yes |
| <a name="input_recovery_message"></a> [recovery\_message](#input\_recovery\_message) | n/a | `string` | `""` | no |
| <a name="input_require_full_window"></a> [require\_full\_window](#input\_require\_full\_window) | n/a | `bool` | `true` | no |
| <a name="input_service"></a> [service](#input\_service) | n/a | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | `"metric alert"` | no |
| <a name="input_warning_threshold"></a> [warning\_threshold](#input\_warning\_threshold) | n/a | `number` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_id"></a> [alert\_id](#output\_alert\_id) | n/a |
<!-- END_TF_DOCS -->