resource "aws_ssm_parameter" "mysql_sg_id" {
  name  = "/${var.project_name}/${var.environment}/mysql_sg_id"
  type  = "String"
  value = module.mysql_sg.sg_id
}

# create the parameter store and store the VPC id
# If the VPC id is not provided in main module output we cant access hehe in user module.. 
# we just give the CIDR for the VPC,VPC id is created after creating vpc. 