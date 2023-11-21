terraform {
    backend "http" {}
    required_providers {
        gitlab {
            source = "gitlabhq/gitlab"
            verison = "16.2.0"
        }
    }
}

provider "gitlab" {
    token = var.GITLAB_TOKEN
}