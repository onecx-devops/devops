resource "github_repository" "repository" {
  name = var.repository_name

  has_issues   = true
  has_projects = true
  auto_init    = true
}

resource "github_branch_default" "main" {
  repository = var.repository_name
  branch     = "main"
}

resource "github_branch_protection_v3" "main" {
  repository = var.repository_name
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
  repository = var.repository_name
  team_id    = var.team_id
  permission = var.team_permission
}

resource "github_app_installation_repository" "app_installation_repository" {
  for_each        = {for app in [var.application_ids] : app => app}
  repository      = var.repository_name
  installation_id = each.value
}