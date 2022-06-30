{{#is_alert}}
${alert_message}
{{/is_alert}}
{{#is_recovery}}
${recovery_message}
{{/is_recovery}}
%{ if no_data_message != "" ~}
{{#is_no_data}}
${no_data_message}
{{/is_no_data}}
%{ endif ~}
%{ if note != "" ~}

Note: ${note}
%{ endif ~}
%{ if docs != "" ~}

Docs: ${docs}
%{ endif ~}
%{ if custom_message != "" ~}
${custom_message}
%{ endif ~}
${notification_channel}
