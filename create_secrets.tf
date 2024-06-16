resource "kubernetes_manifest" "k8s_secrets" {
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
