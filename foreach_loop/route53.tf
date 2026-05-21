# create 3 rote53 private ip records
resource "aws_route53_record" "example" {
    for_each = aws_instance.instance1
  zone_id = "Z0737973GED8JM3MUPPD"   # hosted zone id from R53
  name    = each.key == "backend" ? "var.domain_name" : "${each.key}.$(var.domain_name)" # name of the record
  type    = "A"             #type of the record
  ttl     = 80
  records = each.key == "backend" ? [each.value.public_ip] : [each.value.private_ip]  # tells  to create records using instances ip address
}

