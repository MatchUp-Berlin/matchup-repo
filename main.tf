resource "aws_ecr_repository" "ecr_repo" {
  name                 = var.app_name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
      Terraform   = "true"
      Environment = var.aws_environment
  }
}

resource "aws_ecr_repository" "ecr_repo2" {
  name                 = var.app_name2
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
      Terraform   = "true"
      Environment = var.aws_environment
  }
}

### Creation of IAM Role ECR ###

resource "aws_iam_role" "ecr-manager" {
  name = "ecr_manager"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      },
    ]
  })

  inline_policy {
    name = "ecr-policy"

    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = ["ecr:CompleteLayerUpload",
                      "ecr:GetAuthorizationToken",
                      "ecr:UploadLayerPart",
                      "ecr:InitiateLayerUpload",
                      "ecr:BatchCheckLayerAvailability",
                      "ecr:PutImage"]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }

  tags = {
    Terraform   = "true"
    Environment = var.aws_environment
  }
}