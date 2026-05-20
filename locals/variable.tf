variable "instance_type" {
    type = string
    description = "creating a variable for instance type"
    default = "t2.micro"
  
}


variable "environment" {
    default = "test"
  
}