resource "aws_ecr_repository" "ze_my_ecr" {
  name                 = "ze_my_ecr"
  image_tag_mutability = "MUTABLE"
  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }
}