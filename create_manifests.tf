resource "kubernetes_manifest" "k8s_manifest" {

  for_each = {
    for manifest in var.additional_manifests :
    manifest.content => manifest
  }

  manifest = yamldecode(templatefile(
    "${path.module}/templates/manifest.yaml.tpl",
    {
      "manifest_content"      = each.value["content"]
    }
  ))

}
