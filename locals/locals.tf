locals {
  instance_type = var.environment == "prod" ? "t3.large" : "t2.micro" 
   }