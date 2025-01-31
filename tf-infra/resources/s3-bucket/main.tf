resource "aws_s3_bucket" "ze-my-bucket" {
  bucket = "ze-my-bucket"

  tags = {
    remote_state        = "true"
  }
}