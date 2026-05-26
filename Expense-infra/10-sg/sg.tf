
# creating sg for mysql server
module "mysql-sg" {
  source       = "github.com/GArunkumar999/terraform.git/sg-module?ref=main"
  project_name = "expense"
  environment  = "dev"
  description  = "security group for mysql"
  app          = "mysql"
  vpc_id       = data.aws_ssm_parameter.vpc_id.value

}


# # creating sg for backend server
# module "backend_sg" {
#     source = "git::https://github.com/pushpavathi-wq/Terraform.git//securitygroup_module?ref=main"
#     project_name = var.project_name
#     environment = var.environment
#     vpc_id = data.aws_ssm_parameter.vpc_id.value
    
# }


# # creating sg for frontend server
# module "frontend_sg" {
#     source = "git::https://github.com/pushpavathi-wq/Terraform.git//securitygroup_module?ref=main"
#     project_name = var.project_name
#     environment = var.environment
#     vpc_id = data.aws_ssm_parameter.vpc_id.value
    
# }


# # creating sg for bastion/jump hosts

# module "bastion_sg" {
#     source = "git::https://github.com/pushpavathi-wq/Terraform.git//securitygroup_module?ref=main"
#     project_name = var.project_name
#     environment = var.environment
#     vpc_id = data.aws_ssm_parameter.vpc_id
    
# }