variable "loki_helm_repo_url" {
  type    = string
  default = "https://grafana.github.io/helm-charts"
}

variable "loki_helm_chart" {
  type    = string
  default = "loki-stack"
}

variable "loki_release_name" {
  type    = string
  default = "loki"
}

variable "loki_namespace" {
  type    = string
  default = "phoenix"
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

variable "resources" {
  type = list(object({
    name         = string
    storage      = string
    labels       = map(string)
    access_modes = list(string)
    path         = string
  }))
  description = <<EOT
  Values for the persistent volume and persistent volume claims when in 
  a bare metal context and provisioner is set to local-path.
  If a provisioner is available, set the provisioner variable to the 
  value of the StorageClass for this provisioner.
  EOT
  default = [{

    name    = "loki"
    storage = "8Gi"
    labels = {
      "cosmotech.com/db" = "loki"
    }
    access_modes = ["ReadWriteOnce"]
    path         = "/mnt/loki-storage"
    }
    ,
    {
      name    = "grafana"
      storage = "8Gi"
      labels = {
        "cosmotech.com/db" = "grafana"
      }
      access_modes = ["ReadWriteOnce"]
      path         = "/mnt/grafana-storage"
    }
  ]
}