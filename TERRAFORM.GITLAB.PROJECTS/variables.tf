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

variable "OCTOAPI" {
  type = string
  default = ""
}

