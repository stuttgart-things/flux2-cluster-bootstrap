resource "kubernetes_manifest" "k8s_configmap" {
  depends_on = [flux_bootstrap_git.flux2]

  for_each = {
    for configmap in var.configmaps :
    configmap.name => configmap
  }

  computed_fields = ["data"]
  manifest = yamldecode(templatefile(
    "${path.module}/templates/configmap.yaml.tpl",
    {
      "name"      = each.value["name"]
      "namespace" = each.value["namespace"]
      "kvs"       = each.value["kvs"]
    }
  ))

}
