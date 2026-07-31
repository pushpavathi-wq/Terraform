variable "instance_type" {
  type        = string
  description = "EC2 instance type for the web server"
  default     = "t2.micro"
}



variable "ami" {
    type = string
    description = "creating ami for the instance"
    default = "ami-0220d79f3f480ecf5"
  
}


variable "from_port" {
    type = number
    description = "using variable for ingress port usage"
    default = 22
  
}


variable "to_port" {
    type = number
    description = "using variable for ingress port usage"
    default = 22
  
}






variable "ami" {
  type = "string"
  description = " ami id change"
  default = " "

}
