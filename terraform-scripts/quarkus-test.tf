# Create repository
resource "github_repository" "quarkus_test" {
  name         = "quarkus-devops-test"
  has_issues   = true
  has_projects = true
  auto_init    = true
}

resource "github_branch_default" "main" {
  repository = github_repository.quarkus_test.name
  branch     = "main"
}

resource "github_branch_protection_v3" "main" {
  repository = github_repository.quarkus_test.name
  branch     = "main"

  required_status_checks {
    strict = true
    checks = ["check:39077913"]
  }
}

resource "github_branch_protection" "fix" {
  repository_id = github_repository.quarkus_test.id
  pattern       = "fix/*.*.x"

  required_status_checks {
    strict   = true
    contexts = ["check:39077913"]
  }
}

# Enable apps in repository
resource "github_app_installation_repository" "quarkus_test" {
  for_each        = {for app in [local.applications.sonarcloud] : app => app}
  installation_id = each.value
  repository      = github_repository.quarkus_test.name
}

# Add team to repository
resource "github_team_repository" "quarkus_test_team" {
  team_id    = github_team.quarkus_test_team.id
  repository = github_repository.quarkus_test.id
  permission = "maintain"
}
