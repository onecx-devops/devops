terraform {
  backend "remote" {
    organization = "onecx-devops"

    workspaces {
      name = "devops"
    }
  }
}