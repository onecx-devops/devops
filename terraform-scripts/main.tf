provider "github" {}

# Retrieve information about the currently (PAT) authenticated user
data "github_user" "self" {
  username = "pmcpg"
}

locals {
  organisation = "onecx-devops"
  applications = {
    sonarcloud = "39077913"
  }
}