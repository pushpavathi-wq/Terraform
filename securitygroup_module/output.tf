# output "sg" {
#     value = aws_security_group.sg
  
# }

# output "sg_id" {
#   value = aws_security_group.sg.id
# }


output "sg_id" {
  value = aws_security_group.main.id

}