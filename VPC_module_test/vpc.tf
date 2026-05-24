module "vpc" {
  source = "../Terraform_vpc_module"
  project_name = var.project_name
  environment = var.environment
  common_tags = var.common_tags  # just we are putting common tags in 1 variable
  vpc_cidr   = var.vpc_cidr

}


