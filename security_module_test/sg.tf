module "security_group" {
    source = "../securitygroup_module"
    project_name = "expense"
    environment = "prod"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
  
}