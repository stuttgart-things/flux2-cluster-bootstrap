# flux2-cluster-bootstrap
terraform module for bootstrapping kubernetes clusters w/ flux2

## BOOTSTRAP CLUSTER W/ GITHUB

<details><summary><b>FLUX BOOSTRAP</b></summary>

```hcl
module "bootstrap-app1" {
  source            = "github.com/stuttgart-things/flux2-cluster-bootstrap"
  kubeconfig_path   = "/home/sthings/.kube/app1"
  github_token      = var.github_token
  github_repository = "stuttgart-things"
  github_org        = "stuttgart-things"
  target_path       = "clusters/labul/pve/app1"
}

variable "github_token" { type= string }
```

</details>

<details><summary><b>FLUX BOOSTRAP + SECRET</b></summary>

```hcl
module "bootstrap-app1" {
  source            = "github.com/stuttgart-things/flux2-cluster-bootstrap"
  kubeconfig_path   = "/home/sthings/.kube/app1"
  github_token      = var.github_token
  github_repository = "stuttgart-things"
  github_org        = "stuttgart-things"
  target_path       = "clusters/labul/pve/app1"
  secrets = [
    {
      name = "sops-age"
      namespace = "flux-system"
      kvs = {
        "age.agekey" = "AGE-SECRET-KEY"
      }
    },
  ]
}

variable "github_token" { type= string }
```

</details>

<details><summary><b>FLUX BOOSTRAP + ADDITIONAL MANIFESTS & KUSTOMIZATION_PATCH</b></summary>

```hcl
module "bootstrap-app1" {
  source            = "github.com/stuttgart-things/flux2-cluster-bootstrap"
  kubeconfig_path   = "/home/sthings/.kube/app1"
  github_token      = var.github_token
  github_repository = "stuttgart-things"
  github_org        = "stuttgart-things"
  target_path       = "clusters/labul/pve/app1"
  additional_manifests = [
    {
      content = <<-EOT
apiVersion: v1
kind: ConfigMap
metadata:
  name: ca-pemstore
  namespace: flux-system
data:
  labul-pve.crt: |-
    -----BEGIN CERTIFICATE-----
EOT
    },
  ]

  kustomization_patch = <<-EOT
- patch: |
    - op: add
      path: /spec/template/spec/volumes/-
      value:
        name: ca-pemstore
        configMap:
          name: ca-pemstore
  target:
    kind: Deployment
    name: source-controller
EOT
}

variable "github_token" { type= string }
```

</details>

## EXECUTION

```bash
export TF_VAR_github_token=$GITHUB_TOKEN
terraform init
terraform plan
terraform apply
```

## LICENSE

<details><summary><b>APACHE 2.0</b></summary>

Copyright 2023 patrick hermann.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

</details>

Author Information
------------------
Patrick Hermann, stuttgart-things 01/2024
