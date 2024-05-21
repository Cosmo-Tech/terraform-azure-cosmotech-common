variable "monitoring_namespace" {
  type    = string
}

variable "namespace" {
  type    = string
}

variable "loki_release_name" {
  type    = string
}
variable "loki_persistence_memory" {
  type    = string
}

variable "loki_retention_period" {
  type    = string
}

variable "helm_repo_url" {
  type    = string
}

variable "helm_chart" {
  type    = string
}

variable "loki_max_entries_limet_per_query" {
  type    = number
}

variable "grafana_loki_compatibility_image_tag" {
  type = string
}
