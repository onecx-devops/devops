provider "github" {}

data "github_user" "self" {
  username = "pmcpg"
}

locals {
  organisation = "onecx-devops"
  applications = {
    sonarcloud = "39077913"
  }
}

module "products" {
  source = "products/example-product"
}