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
  path = var.target_path
  depends_on = [github_repository_deploy_key.ssh]
}