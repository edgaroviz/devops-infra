resource "aws_s3_bucket" "ze-my-bucket" {
  bucket = "ze-my-bucket"
  force_destroy = true
  tags = {
    remote_state        = "true"
  }
}