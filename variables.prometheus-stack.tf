variable "create_prometheus_stack" {
  type    = bool
  default = true
}

variable "prom_namespace" {
  type = string
}

variable "prometheus_stack_version" {
  type    = string
  default = "57.1.0"
}

variable "prom_helm_chart" {
  type    = string
  default = "kube-prometheus-stack"
}

variable "prom_helm_repo_url" {
  type    = string
  default = "https://prometheus-community.github.io/helm-charts"
}

variable "prom_helm_release_name" {
  type    = string
  default = "kube-prometheus-stack"
}

variable "prom_cpu_mem_limits" {
  type    = string
  default = "4Gi"
}

variable "prom_cpu_mem_request" {
  type    = string
  default = "2Gi"
}

variable "prom_storage_resource_request" {
  type    = string
  default = "64Gi"
}

variable "prom_storage_class_name" {
  type    = string
  default = "default"
}

variable "prom_replicas_number" {
  type    = string
  default = "1"
}

variable "prom_retention" {
  type    = string
  default = "100d"
}

variable "redis_port" {
  type    = number
  default = 6379
}