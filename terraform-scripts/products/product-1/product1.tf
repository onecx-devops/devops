module "global" {
  source = "../../modules/global_constants"
}

module "repository-test3" {
  source = "../../modules/repository"

  repository_name           = "test2"
  team_permission           = "maintain"
  team_id                   = module.team3.team_id
  application_ids           = module.global.applications_sonarcloud_id
}

module "team3" {
  source = "../../modules/team"

  team_name        = "test2-team"
  team_description = "description team 2"
  team_file_path   = "products/product-1/team.csv"
  repository_name  = module.repository-test3.repository_name
  repository_id    = module.repository-test3.repository_id
}

module "sonar" {
  source = "../../modules/sonarcloud"

  organisation    = module.global.organisation
  repository_name = module.repository-test3.repository_name
}
