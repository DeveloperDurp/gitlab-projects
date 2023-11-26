provider "octopusdeploy" {
  address = "https://octopus.internal.durp.info"
  api_key = var.OCTOAPI
}

resource "octopusdeploy_tenant" "tenant" {
  name = var.GITLAB_PROJECT_NAME
  project_environment {
    environments = [
      "Environments-1"
    ]
    project_id = "Projects-1"
  }
  tenant_tags = [
    octopusdeploy_tag.gitlabprojects.canonical_tag_name
  ]
}

resource "octopusdeploy_tag" "gitlabprojects" {
  name = "Gitlab Project"
  color = "#333333"
  tag_set_id = "TagSets-1"
}

resource "octopusdeploy_tenant_common_variable" "gitlabprojectname" {
  library_variable_set_id = "LibraryVariableSets-2"
  template_id = "f14ad0ff-d8cf-44a8-bd8d-ff23b0fdb0f4"
  tenant_id = octopusdeploy_tenant.tenant.id
  value = var.GITLAB_PROJECT_NAME
}

resource "octopusdeploy_tenant_common_variable" "gitlabrunnerid" {
  library_variable_set_id = "LibraryVariableSets-2"
  template_id = "25732879-3567-4d0b-9aad-2769befabf42"
  tenant_id = octopusdeploy_tenant.tenant.id
  value = var.GITLAB_SHARED_RUNNER_ID
}
