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
    checks = ["SonarCloud Code Analysis"]
  }
}

resource "github_branch_protection" "fix" {
  repository_id = github_repository.quarkus_test.id
  pattern       = "fix/*.*.x"

  required_status_checks {
    strict   = true
    contexts = ["SonarCloud Code Analysis"]
  }
}

# Enable apps in repository
resource "github_app_installation_repository" "quarkus_test" {
  for_each        = {for app in [local.applications.sonarcloud] : app => app}
  repository      = github_repository.quarkus_test.name
  installation_id = each.value
}

# Add team to repository
resource "github_team_repository" "quarkus_test_team" {
  repository = github_repository.quarkus_test.id
  team_id    = github_team.quarkus_test_team.id
  permission = "maintain"
}

resource "github_repository_file" "sonar_project_properties" {
  repository = github_repository.quarkus_test.name
  branch     = "main"
  file       = "sonar-project.properties"
  content    = "sonar.projectKey=${local.organisation}_${github_repository.quarkus_test.name}\nsonar.organization=${local.organisation}"
  overwrite_on_create = true
}

resource "github_repository_file" "workflow_build" {
  repository          = github_repository.quarkus_test.name
  branch              = "main"
  file                = ".github/workflows/build.yml"
  content             = file("files/workflow_build.txt")
  overwrite_on_create = true
}