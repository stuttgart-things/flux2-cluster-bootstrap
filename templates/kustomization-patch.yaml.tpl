---
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
resources:
  - gotk-components.yaml
  - gotk-sync.yaml
patches:
  - patch: |
      - op: add
        path: /spec/template/spec/volumes/-
        value:
          name: ca-pemstore
          configMap:
            name: ca-pemstore
      - op: add
        path: /spec/template/spec/containers/0/volumeMounts/-
        value:
          name: ca-pemstore
          mountPath: /etc/ssl/certs/my-cert.pem
          subPath: labul-pve.crt
          readOnly: true
      - op: add
        path: /spec/template/spec/containers/0/volumeMounts/-
        value:
          name: ca-pemstore
          mountPath: /etc/ssl/certs/labul-vsphere.pem
          subPath: labul-vsphere.crt
          readOnly: true
    target:
      kind: Deployment
      name: source-controller