# create 3 rote53 private ip records
resource "aws_route53_record" "example" {
    count = length(var.names)
  zone_id = "Z095734524HNNHQZKQEB7"   # hosted zone id from R53
  name    = "${var.names[count.index]}.${var.domain}"   # name of the record
  type    = "A"             #type of the record
  ttl     = 80
  records = [aws_instance.instance1[count.index].private_ip]  # tells  to create records using instances ip address
}

