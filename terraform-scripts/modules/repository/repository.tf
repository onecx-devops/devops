resource "github_repository" "repository" {
  name         = var.repository_name
  has_issues   = true
  has_projects = true
  auto_init    = true
}

resource "github_branch_default" "main" {
  repository = github_repository.repository.name
  branch     = "main"
}

resource "github_branch_protection_v3" "main" {
  repository = github_repository.repository.name
  branch     = "main"

  required_status_checks {
    strict = true
    checks = ["SonarCloud Code Analysis"]
  }
}

resource "github_branch_protection" "fix" {
  repository_id = github_repository.repository.id
  pattern       = "fix/*.*.x"

  required_status_checks {
    strict   = true
    contexts = ["SonarCloud Code Analysis"]
  }
}

resource "github_team_repository" "team" {
  repository = github_repository.repository.name
  team_id    = var.team_id
  permission = var.team_permission
}
