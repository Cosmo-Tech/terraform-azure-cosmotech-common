variable "create_argocd" {
  type = bool
}

variable "argocd_namespace" {
  type    = string
  default = "argocd"
}

variable "argocd_helm_repo_url" {
  type = string
}

variable "argocd_helm_chart" {
  type = string
}

variable "argocd_helm_chart_version" {
  type = string
}

variable "argocd_helm_release_name" {
  type = string
}

variable "argocd_replicas" {
  type = number
}

variable "argocd_create_ingress" {
  type = bool
}

variable "argocd_project" {
  type = string
}

variable "argocd_repositories" {
  type = list(object({
    url      = string
    private  = bool
    token    = string
    username = string
  }))
  sensitive = true
}

variable "argocd_setup_job_image_version" {
  type = string
}
