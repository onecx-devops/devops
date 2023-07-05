resource "github_team" "team" {
  name                      = var.team_name
  description               = var.team_description
  create_default_maintainer = false
  privacy                   = "closed"
  # use for nested teams
  #  parent_team_id = ""
}

resource "github_team_membership" "team_membership" {

  team_id = github_team.team.id
  for_each = {
    for member in csvdecode(file(var.team_file_path)) :
    member.username => member
  }

  username = each.value.username
  role     = each.value.role
}
