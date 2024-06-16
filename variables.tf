variable "context" {
  type        = string
  default     = "default"
  description = "kube cluster context"
}

variable "keep_namespace" {
 description = "Keep namespace after deletion"
 type        = bool
 default     = false
}

variable "components_extra" {
  description = "Extra components"
  type        = list(string)
  default     = ["image-automation-controller"]
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

variable "secrets" {
  type = list(object({
    name      = string
    namespace = string
    kvs       = map(string)
  }))
  default     = []
  description = "A list of secret objects"
}

variable "configmaps" {
  type = list(object({
    name      = string
    namespace = string
    kvs       = map(string)
  }))
  default     = []
  description = "A list of configmap objects"
}

variable "kustomization_patch" {
  type        = string
  default = <<-EOT
  {}
  EOT
  description = "patch"
}

variable "additional_manifests" {
  type = list(object({
    content      = string
  }))
  default     = []
  description = "A list of additional_manifests to deploy"
}
