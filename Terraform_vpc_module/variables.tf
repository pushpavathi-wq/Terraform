variable "vpc_cidr" {           # mandatory
    #default = "10.0.0.0/16"
  
}

variable "project_name" {
    #default = "expense"

  
}

variable "environment" {
    #default = "dev"
  
}

variable "vpc_tags" {
    default = {}
  
}




variable "dns_hostname" {
    default = true  # true indicates that allows DNS name req's  # if false allows only IP's
  
}

#project name, env are common tags

variable "common_tags" {
    type = map   # the one developed this module he gives a variable like this
#then we need to put common tags in a variable.tf file at test modules

  
}


variable "internet_gateway_tags" {
    default = {}
  
}

variable "cidr_publicsubnet" {
    validation {
      condition = length(var.cidr_publicsubnet) == 2
      error_message = "please pass two subnets range within VPC"
    }
  
}


variable "cidr_privatesubnet" {
    validation {
      condition = length(var.cidr_privatesubnet) == 2
      error_message = "please pass two subnets range within VPC"
    }
  
}


variable "cidr_databasesubnet" {
    validation {
      condition = length(var.cidr_databasesubnet) == 2
      error_message = "please pass two subnets range within VPC"
    }
  
}



