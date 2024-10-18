variable "project_name" {
  description = "The project name"
  type        = string
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

variable "project_customer_name" {
  description = "The customer name"
  type        = string
}

variable "project_image_path" {
  type = string
}

variable "project_cost_center" {
  type = string
}
