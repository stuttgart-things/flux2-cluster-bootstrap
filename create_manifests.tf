resource "kubernetes_manifest" "additional_manifests" {

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
