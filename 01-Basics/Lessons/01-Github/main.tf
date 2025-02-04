terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
   heroku = {
      source  = "heroku/heroku"
      version = "5.0.2"
    }
}
}

# Configure the GitHub Provider
provider "github" {}

variable "GITHUB_TOKEN" {}

provider "heroku" {
  # Configuration options
  email   = "lucpizz@gmail.com"
  api_key = var.heroku_api_key
}

variable "heroku_api_key" {
  default = ""
}

resource "github_repository" "example" {
  name        = "terraform-example"
  description = "My terraform repo for testing"

  visibility = "public"

}
resource "heroku_app" "my_app" {
  name = github_repository.main_app.name
  region = "us"
}


resource "github_repository" "main_app" {
  name        = var.app_name
  description = "My awesome web page"
  visibility = "public"
}