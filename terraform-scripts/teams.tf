resource "github_team" "quarkus_test_team" {
  name                      = "quarkus-test-team"
  description               = "quarkus-test team"
  create_default_maintainer = false
  privacy                   = "closed"
  # use for nested teams
  #  parent_team_id = ""
}

resource "github_team_members" "quarkus_test_team" {

  team_id = github_team.quarkus_test_team.id
  members {
    username = "pmcpg"
    role     = "maintainer"
  }
}
