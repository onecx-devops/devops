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

terraform {

  backend "s3" {

    bucket = "onecx-terraform-devops"
    key = "state/terraform.tfstate"
    region = "eu-central-1"
    encrypt = true
  }
}


resource "github_repository" "repository" {
  name         = "asdf-new"
  has_issues   = true
  has_projects = true
  auto_init    = true
}