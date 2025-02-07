resource "aws_s3_bucket" "ze_my_bucket" {
  bucket = "ze_my_bucket"
  force_destroy = true
  tags = {
    remote_state        = "true"
  }
}