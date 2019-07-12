resource "aws_ecr_repository" "repo" {
  name = var.name
}

resource "aws_ecr_lifecycle_policy" "repo" {
  repository = aws_ecr_repository.repo.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep last 30 images",
            "selection": {
                "tagStatus": "tagged",
                "tagPrefixList": ["v"],
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF

}

resource "aws_ecr_repository_policy" "repo" {
  repository = aws_ecr_repository.repo.name

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "policy share ECR across accounts",
            "Effect": "Allow",
            "Principal": {
                "AWS": [
                    "arn:aws:iam::087636251088:root",
                    "arn:aws:iam::581912402403:root"
                ]
            },
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages"
            ]
        }
    ]
}
EOF

}

