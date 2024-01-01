terraform {
  required_version = ">= 1.6.5"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.24.0"
    }

    flux = {
      source = "fluxcd/flux"
      version = "1.2.2"
    }

    github = {
      source  = "integrations/github"
      version = ">=5.18.0"
    }

  }
}
