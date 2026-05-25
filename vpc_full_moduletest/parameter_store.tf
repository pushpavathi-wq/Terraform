resource "aws_ssm_parameter" "expense-vpc-id" {
  name  = "/${var.project_name}/${var.environment}/vpc_id"
  type  = "String"
  value = "module.vpc.vpc_id"
}

# create the parameter store and store the VPC id
# If the VPC id is not provided in main module output we cant access hehe in user module.. 
# we just give the CIDR for the VPC,VPC id is created after creating vpc. 