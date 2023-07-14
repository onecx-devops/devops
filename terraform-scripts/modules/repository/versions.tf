terraform {
  required_providers {
    sonarcloud = {
      source  = "rewe-digital/sonarcloud"
      version = "~> 0.5.2"
    }
    github = {
      source  = "integrations/github"
      version = "~> 5.28.1"
    }
  }
  required_version = "~> 1.5.1"
}