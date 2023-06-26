# Create repository
resource "github_repository" "quarkus_test" {
  name = "quarkus-test_test"
}

# Create team
resource "github_team" "quarkus_test_team" {
  name                      = "quarkus-test-team"
  description               = "quarkus-test team"
  create_default_maintainer = false
  privacy                   = "closed"
}

# Add team to repository
resource "github_team_repository" "quarkus_test_team" {
  team_id    = github_team.quarkus_test_team.id
  repository = github_repository.quarkus_test.id
  permission = "maintain"
}

# Add users to the team
resource "github_team_membership" "quarkus_test_team" {
  for_each = { for tm in ["pmcpg"] : tm => tm }
  team_id  = github_team.quarkus_test_team.id
  username = each.value
  role     = "maintainer"
}
