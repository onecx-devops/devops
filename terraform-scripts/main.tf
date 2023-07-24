provider "github" {
  owner = local.organisation
}

#provider "sonarcloud" {
#  organization = local.organisation
#}

locals {
  organisation = "onecx-devops"
  applications = {
    sonarcloud = "39077913"
  }
}

#module "products" {
#  source = "./products/example-product"
#}

resource "github_repository" "repository" {
  name         = "asdf-new"
  has_issues   = true
  has_projects = true
  auto_init    = true
}