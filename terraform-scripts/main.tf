terraform {

  backend "s3" {}
}

provider "github" {
  owner = local.organisation
}

provider "sonarcloud" {
  organization = local.organisation
}

locals {
  organisation = "onecx-devops"
  applications = {
    sonarcloud = "39077913"
  }
}

module "products" {
  source = "./products/example-product"
}
