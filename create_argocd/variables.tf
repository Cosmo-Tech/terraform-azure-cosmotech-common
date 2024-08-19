variable "namespace" {
  type = string
  default = "argocd"
}

variable "helm_repo_url" {
  type    = string
}

variable "helm_chart" {
  type    = string
}

variable "helm_chart_version" {
  type    = string
}

variable "helm_release_name" {
  type    = string
}

variable "replicas" {
    type = number
}

variable "create_ingress" {
  type = bool
}

variable "argocd_project" {
  type = string
}

variable "argocd_repositories" {
  type = list(string)
}

variable "argocd_dns_name" {
  type = string
}

variable "argocd_repository_username" {
  type = string
  sensitive = true
}

variable "argocd_repository_access_token" {
  type = string
  sensitive = true
}

variable "argocd_setup_job_image_version" {
  type = string
}