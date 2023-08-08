terraform {
  cloud {
    organization = "onecx-devops"

    workspaces {
      name = "devops"
    }
  }
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
