variable "GITLAB_TOKEN" {
  type = string
}

variable "GITLAB_PROJECT_NAME" {
  type = string
}

variable "GITLAB_SHARED_RUNNER_ID" {
  type = number
  default = 0
}

variable "Enable_OCTOAPI" {
  type = bool
  default = false
}

variable "OCTOAPI" {
  type = string
  default = ""
}

variable "OCTO_TENANT_ID" {
  type = string
}

variable "Development" {
  type = bool
  default = false
}
