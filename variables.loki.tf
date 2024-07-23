variable "loki_release_name" {
  type    = string
  default = "loki"
}
variable "loki_persistence_memory" {
  type    = string
  default = "4Gi"
}

variable "loki_retention_period" {
  type    = string
  default = "720h"
}

variable "loki_max_entries_limet_per_query" {
  type    = number
  default = 50000
}

variable "grafana_loki_compatibility_image_tag" {
  type    = string
  default = "9.3.6"
}