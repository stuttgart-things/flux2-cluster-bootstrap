variable "context" {
  type        = string
  default     = "default"
  description = "kube cluster context"
}

variable "kubeconfig_path" {
  type        = string
  default     = "~/.kube/config"
  description = "kubeconfig path"
}

variable "github_token" {
  type        = string
  description = "github token"
}

variable "github_repository" {
  type        = string
  default     = "stuttgart-things"
  description = "github repository name"
}

variable "github_org" {
  type        = string
  default     = "stuttgart-things"
  description = "github repository name"
}

variable "target_path" {
  type        = string
  default     = "staging-cluster"
  description = "flux sync target path"
}
