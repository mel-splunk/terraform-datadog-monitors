resource "datadog_monitor" "su_utilization" {
  name    = "[${var.environment}] Streaming Units utilization at more than ${var.su_utilization_threshold_critical}% on {{name}}"
  message = "${var.message}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.resource_utilization{${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_eventhub:enabled,env:%s", var.environment) : "*"}} by {name,resource_group} > ${var.su_utilization_threshold_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.su_utilization_threshold_warning}"
    critical = "${var.su_utilization_threshold_critical}"
  }
}

resource "datadog_monitor" "failed_function_requests" {
  name    = "[${var.environment}] More than ${var.function_requests_threshold_critical} failed function requests on {{name}}"
  message = "${var.message}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.aml_callout_failed_requests{${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_eventhub:enabled,env:%s", var.environment) : "*"}} by {name,resource_group} > ${var.function_requests_threshold_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.function_requests_threshold_warning}"
    critical = "${var.function_requests_threshold_critical}"
  }
}

resource "datadog_monitor" "conversion_errors" {
  name    = "[${var.environment}] More than ${var.conversion_errors_threshold_critical} conversion errors on {{name}}"
  message = "${var.message}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.conversion_errors{${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_stream_analytics:enabled,env:%s", var.environment) : "*"}} by {name,resource_group} > ${var.conversion_errors_threshold_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.conversion_errors_threshold_warning}"
    critical = "${var.conversion_errors_threshold_critical}"
  }
}

resource "datadog_monitor" "runtime_errors" {
  name    = "[${var.environment}] More than ${var.runtime_errors_threshold_critical} runtime errors on {{name}}"
  message = "${var.message}"

  query = "avg(last_5m):avg:azure.streamanalytics_streamingjobs.errors{${var.use_filter_tags == "true" ? format("dd_monitoring:enabled,dd_azure_eventhub:enabled,env:%s", var.environment) : "*"} by {name,resource_group}} > ${var.runtime_errors_threshold_critical}"
  type  = "query alert"

  notify_no_data      = "${var.notify_no_data}"
  evaluation_delay    = "${var.delay}"
  renotify_interval   = 60
  notify_audit        = false
  timeout_h           = 0
  include_tags        = true
  locked              = false
  require_full_window = true
  new_host_delay      = "${var.delay}"
  no_data_timeframe   = 20
  thresholds {
    warning  = "${var.runtime_errors_threshold_warning}"
    critical = "${var.runtime_errors_threshold_critical}"
  }
}
