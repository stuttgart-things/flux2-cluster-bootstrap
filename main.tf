provider "flux" {
  kubernetes = {
    config_context = var.context
    config_path    = var.kubeconfig_path
  }

  git = {
    url = "ssh://git@github.com/${var.github_org}/${var.github_repository}.git"
    ssh = {
      username    = "git"
      private_key = tls_private_key.flux.private_key_pem
    }
  }
}

resource "flux_bootstrap_git" "flux2" {
  depends_on = [kubernetes_manifest.additional_manifests, github_repository_deploy_key.ssh, kubernetes_manifest.k8s_secrets]
  path       = var.target_path
  components_extra = var.components_extra
  kustomization_override = templatefile(
    "${path.module}/templates/kustomization-patch.yaml.tpl",
    { 
      kustomization = var.kustomization_patches 
    }
  )
  embedded_manifests     = true
  keep_namespace         = var.keep_namespace
}
