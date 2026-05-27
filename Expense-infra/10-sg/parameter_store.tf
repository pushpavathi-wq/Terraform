# resource "aws_ssm_parameter" "mysql_id" {
#   name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
#   type  = "String"
#   value = module.mysql_id.sg_id
# }

# create the parameter store and store the VPC id
# If the VPC id is not provided in main module output we cant access hehe in user module.. 
# we just give the CIDR for the VPC,VPC id is created after creating vpc. 


# resource "aws_ssm_parameter" "mysql-sg" {
#   name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
#   type  = "String"
#   value = module.mysql-sg.sg_id
# }


resource "aws_ssm_parameter" "alb-sg" {
  name  = "/${var.project_name}/${var.environment}/alb_sg"
  type  = "String"
  value = module.alb-sg.sg_id
}

resource "aws_ssm_parameter" "bastion_sg" {
  name  = "/${var.project_name}/${var.environment}/bastion_sg"
  type  = "String"
  value = module.bastion_sg.sg_id
}