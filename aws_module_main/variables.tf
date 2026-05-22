variable "ami_id" {
    default = "ami-0220d79f3f480ecf5"
  
}


variable "instance_type" {
    #default = "t2.micro"

     validation {
    condition     = contains(["t2.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "not the valid values"
  }
  
}