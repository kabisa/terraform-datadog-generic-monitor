{{#is_alert}}
${alert_message}
{{/is_alert}}
{{#is_recovery}}
${recovery_message}
{{/is_recovery}}
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
