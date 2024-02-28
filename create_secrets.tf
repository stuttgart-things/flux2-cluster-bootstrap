resource "kubernetes_manifest" "k8s_secret" {
  depends_on = [flux_bootstrap_git.flux2]

  for_each = {
    for secret in var.secrets :
    secret.name => secret
  }

  computed_fields = ["stringData"]
  manifest = yamldecode(templatefile(
    "${path.module}/templates/secret.yaml.tpl",
    {
      "name"      = each.value["name"]
      "namespace" = each.value["namespace"]
      "kvs"       = each.value["kvs"]
    }
  ))

}

// KUBECONFIG FILE HANDLING
data "local_file" "kubeconfig" {
  filename = var.kubeconfig_path
}

locals {
  kubeconfig = yamldecode(data.local_file.kubeconfig.content)
}