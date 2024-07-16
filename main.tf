resource "aws_s3_bucket" "ZeBucket" {
  bucket = "ZeBucket"

  tags = {
    Environment = "Dev"
  }
}