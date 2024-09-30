terraform {
  required_version = ">= 1.6.5"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.26.0"
    }

    flux = {
      source  = "fluxcd/flux"
      version = "1.4.0"
    }

    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }

    github = {
      source  = "integrations/github"
      version = "6.2.3"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

provider "kubernetes" {
  config_context = var.context
  config_path    = var.kubeconfig_path
}
