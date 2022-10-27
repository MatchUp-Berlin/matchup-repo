output "ecr_repo_name" {
  value = aws_ecr_repository.ecr_repo.name
}

output "ecr_repo_url" {
  value = aws_ecr_repository.ecr_repo.repository_url
}

output "ecr_repo_name2" {
  value = aws_ecr_repository.ecr_repo2.name
}

output "ecr_repo_url2" {
  value = aws_ecr_repository.ecr_repo2.repository_url
}