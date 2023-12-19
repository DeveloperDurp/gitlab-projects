provider "gitlab" {
  token = var.GITLAB_TOKEN
}

resource "gitlab_project" "project" {
  name                                  = octopusdeploy_tenant.tenant.name
  allow_merge_on_skipped_pipeline       = false
  only_allow_merge_if_pipeline_succeeds = true
  remove_source_branch_after_merge      = true
  squash_option                         = "default_on"
  ci_config_path                        = ".gitlab/.gitlab-ci.yml"
  shared_runners_enabled                = false
  visibility_level                      = "public"
  ci_forward_deployment_enabled         = true
}

resource "gitlab_branch_protection" "master" {
  project            = gitlab_project.project.id
  branch             = "main"
  push_access_level  = "maintainer"
  merge_access_level = "developer"
  allow_force_push   = false
}

resource "gitlab_branch_protection" "release" {
  project            = gitlab_project.project.id
  branch             = "release/*"
  push_access_level  = "maintainer"
  merge_access_level = "developer"
  allow_force_push   = false
}

resource "gitlab_project_runner_enablement" "k3s" {
  project   = gitlab_project.project.id
  runner_id = octopusdeploy_tenant_common_variable.gitlabrunnerid.value
}


resource "gitlab_project_variable" "OCTOAPI" {
  count = var.Enable_OCTOAPI ? 1 : 0 
  project   = gitlab_project.project.id
  key       = "OCTOAPI"
  value     = var.OCTOAPI
  protected = false
  masked    = true
}
