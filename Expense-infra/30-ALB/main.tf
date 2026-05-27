module "alb" {
  source = "terraform-aws-modules/alb/aws"
  internal = true
  name    = "${var.project_name}-${var.environment}-app-alb"  # expense-dev-app-alb
  vpc_id  = data.aws_ssm_parameter.vpc_id.value
  subnets = local.private_subnet_ids
  create_security_group = false
  security_groups = local.private_subnet_ids
  enable_deletion_protection = false
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-app-alb"
    }
  )
}