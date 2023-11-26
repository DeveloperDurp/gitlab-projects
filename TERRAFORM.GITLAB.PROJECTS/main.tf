terraform {
  backend "http" {}
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "16.2.0"
    }
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
      version = "0.13.3"
    }
  }
}

