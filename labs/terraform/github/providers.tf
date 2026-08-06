terraform {
  required_version = ">= 1.12.2" # Replace with your installed version
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {}