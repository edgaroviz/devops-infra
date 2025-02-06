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

resource "aws_iam_policy" "ze_my_admin_policy" {
  name        = "AdminPolicy"
  description = "Fine-grained policy granting access to manage S3, VPC, EKS, and IAM resources with Terraform."

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = [
          "s3:CreateBucket",
          "s3:DeleteBucket",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:PutBucketPolicy",
          "s3:GetBucketPolicy"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "ec2:CreateVpc",
          "ec2:DeleteVpc",
          "ec2:DescribeVpcs",
          "ec2:CreateSubnet",
          "ec2:DeleteSubnet",
          "ec2:DescribeSubnets",
          "ec2:ModifyVpcAttribute",
          "ec2:ModifySubnetAttribute"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "eks:CreateCluster",
          "eks:DeleteCluster",
          "eks:DescribeCluster",
          "eks:ListClusters",
          "eks:UpdateClusterConfig",
          "eks:TagResource"
        ],
        Resource = "*"
      },
      {
        Effect   = "Allow",
        Action   = [
          "iam:CreatePolicy",
          "iam:DeletePolicy",
          "iam:GetPolicy",
          "iam:ListPolicies",
          "iam:CreateRole",
          "iam:DeleteRole",
          "iam:GetRole",
          "iam:AttachRolePolicy",
          "iam:DetachRolePolicy",
          "iam:CreateOpenIDConnectProvider",
          "iam:DeleteOpenIDConnectProvider",
          "iam:GetOpenIDConnectProvider"
        ],
        Resource = "*"
      }
    ]
  })
}
