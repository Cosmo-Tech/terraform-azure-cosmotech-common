variable "location" {
  type = string
}

variable "application_id" {
  type = string
}

variable "resource_group" {
  type = string
}

variable "client_secret" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.25.6"
}

variable "project_stage" {
  description = "The Project stage"
  type        = string
  validation {
    condition = contains([
      "OnBoarding",
      "Dev",
      "QA",
      "IA",
      "EA",
      "Doc",
      "Support",
      "Demo",
      "Prod",
      "PreProd"
    ], var.project_stage)
    error_message = "Stage must be either: OnBoarding, Dev, QA, IA, EA, Demo, Prod, PreProd, Doc, Support."
  }
}

variable "customer_name" {
  description = "The customer name"
  type        = string
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "cost_center" {
  type    = string
  default = "NA"
}