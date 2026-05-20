resource "aws_instance" "production" {
    instance_type = var.environment == "prod" ? "t3.micro" : "t2.small"
    ami = "ami-0220d79f3f480ecf5"


   tags = {
     name = "pushpa"
   }
  
}