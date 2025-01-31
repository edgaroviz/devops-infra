resource "aws_ecr_repository" "ze-counter-service-ecr" {
  name                 = "ze-counter-service-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}