---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - gotk-components.yaml
  - gotk-sync.yaml
%{ if length(patches) > 0 }
patches:
  %{ for patch in patches }
  - patch: |
    ${patch}
  %{ endfor ~}
%{ endif }
