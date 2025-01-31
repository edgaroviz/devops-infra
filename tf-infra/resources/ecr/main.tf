resource "aws_ecr_repository" "ze-my-ecr" {
  name                 = "ze-my-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}