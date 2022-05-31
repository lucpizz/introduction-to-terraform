terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {}


resource "github_repository" "example" {
  name        = "example"
  description = "My awesome web page"

    visibility = "private"

  pages {
    source {
      branch = "master"
      path   = "/docs"
    }
  }
}
