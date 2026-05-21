resource "aws_ecr_repository" "foo" {
  name                 = "bar"
  image_tag_mutability = "MUTABLE"   # image tag can be changed after pushing to ecr also (immutable cant change)

  image_scanning_configuration {
    scan_on_push = true ( scan the vulnerability before deployment)
  }
}
