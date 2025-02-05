resource "aws_iam_policy" "ecr_policy" {
  name        = "ECRpush-only_for-ze-my-ecr "
  description = "IAM policy for accessing ECR repository"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ecr:GetAuthorizationToken",
          "ecr:BatchCheckLayerAvailability",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
        Resource = "arn:aws:ecr:eu-west-1:920373021859:repository/ze-my-ecr"
      }
    ]
  })
}