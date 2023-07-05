output "repository_id" {
  value = github_repository.repository.id
}

output "repository_name" {
  value = github_repository.repository.name
}

output "team_name" {
  value = github_team_repository.team
}
