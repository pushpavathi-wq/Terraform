variable "instances" {
    type = map
    default = {

        mysql = "t2.micro"
        backend = "t2.micro"
        frontend = "t2.micro"
    }
  
}


variable "domain_name" {
    default = "daws82s.fun"
  
}


