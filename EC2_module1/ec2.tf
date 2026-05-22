#basic EC2 instance creating using modules

module "module_instance" {
  source  = "../aws_module_main"  # path to main module where it is present

  instance_type = "t2.micro"


 
}