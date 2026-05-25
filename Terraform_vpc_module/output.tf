output "number_azs" {
    value = data.aws_availability_zones.available.names
  
}


output "vpc_id" {
    value = "aws_vpc.main.id"
  
}


output "public_subnet_ids" {
    value = aws_subnet.public_subnet[*].id  # * is used to print all subnets
  
}

output "private_subnet_ids" {
    value = aws_subnet.private_subnet[*].id
  
}


output "public_database_ids" {
    value = aws_subnet.database_subnet[*].id
  
}
