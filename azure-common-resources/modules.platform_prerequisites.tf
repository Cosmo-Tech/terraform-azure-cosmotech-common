module "create-platform-prerequisite" {
  source = "./create-platform-prerequisites"

  count = var.deployment_type != "ARM" ? 1 : 0

  project_stage  = var.project_stage
  project_name   = var.project_name
  owner_list     = var.owner_list
  location       = var.location
  resource_group = var.resource_group
  customer_name  = var.customer_name
  image_path     = var.image_path
  cost_center    = var.cost_center
}