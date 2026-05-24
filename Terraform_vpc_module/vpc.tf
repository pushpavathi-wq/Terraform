resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.dns_hostname  # used when we want to allow requess from dns/ip's

# project name, env are common tags here
  tags = merge(
   var.common_tags,
   var.vpc_tags,
   
  
    {
        Name = "${var.project_name}-${var.environment}"
    }
  
  ) 
  }
