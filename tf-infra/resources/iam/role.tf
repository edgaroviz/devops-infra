resource "aws_iam_role" "ze_my_ecr_role" {
  name = "ze-my-ecr-role"
  depends_on = [ aws_iam_policy.ecr_policy ]
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = "arn:aws:iam::920373021859:oidc-provider/token.actions.githubusercontent.com"
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          }
          StringLike = {
            "token.actions.githubusercontent.com:sub" = [
              "repo:edgaroviz/devops-infra:*",
              "repo:edgaroviz/counter-service:*"
            ]
          }
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ze_my_ecr_role_attach" {
  depends_on = [ aws_iam_role.ze_my_ecr_role ]
  role       = aws_iam_role.ze_my_ecr_role.name
  policy_arn = aws_iam_policy.ecr_policy.arn
}
