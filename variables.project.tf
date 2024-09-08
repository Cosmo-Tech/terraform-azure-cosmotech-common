variable "project_name" {
  description = "The project name"
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

variable "project_customer_name" {
  description = "The customer name"
  type        = string
  default     = "cosmotech"
}

variable "project_image_path" {
  type    = string
  default = "./cosmotech.png"
}

variable "project_cost_center" {
  type    = string
  default = "NA"
}
