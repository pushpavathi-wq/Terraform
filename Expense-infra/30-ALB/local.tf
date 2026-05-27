locals {
  private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
  alb-sg = data.aws_ssm_parameter.alb-sg
}