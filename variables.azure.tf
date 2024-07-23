variable "deployment_type" {
  type    = string
  default = "Terraform"
  validation {
    condition = contains([
      "ARM",
      "Terraform"
    ], var.deployment_type)
    error_message = "Stage must be either: ARM or Terraform."
  }
  description = "Represents the kind of deployment. Currently two modes: ARM or Terraform"
}

variable "location" {
  description = "The Azure location"
  default     = "West Europe"
}

variable "project_name" {
  description = "The project name"
  type        = string
}

variable "owner_list" {
  description = "List of mail addresses for App Registration owners"
  type        = list(string)
}

variable "subscription_id" {
  description = "The subscription id"
  type        = string
}

variable "resource_group" {
  type    = string
  default = ""
}

variable "platform_url" {
  description = "The platform url"
  type        = string
  default     = ""
}

variable "identifier_uri" {
  description = "The platform identifier uri"
  type        = string
  default     = ""
}

variable "project_stage" {
  description = "The Project stage"
  type        = string
  default     = "Dev"
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
  default     = "cosmotech"
}

variable "audience" {
  description = "The App Registration audience type"
  type        = string
  validation {
    condition = contains([
      "AzureADMyOrg",
      "AzureADMultipleOrgs"
    ], var.audience)
    error_message = "Only AzureADMyOrg and AzureADMultipleOrgs are supported for audience."
  }
  default = "AzureADMultipleOrgs"
}

variable "image_path" {
  type    = string
  default = "./cosmotech.png"
}

variable "create_cosmosdb" {
  type    = bool
  default = false
}

variable "create_backup" {
  type    = bool
  default = false
}

variable "create_adx" {
  type    = bool
  default = false
}


