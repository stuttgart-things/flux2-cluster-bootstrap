# flux2-cluster-bootstrap
terraform module for bootstrapping kubernetes clusters w/ flux2

## BOOTSTRAP CLUSTER W/ GITHUB

```bash
terraform apply \
-var "github_org=stuttgart-things" \
-var "github_repository=stuttgart-things" \
-var "github_token=<TOKEN>" \
-var "target_path=clusters/labda/vsphere/utah" \
-var "kubeconfig_path=/home/sthings/.kube/labda-utah" \
-var "context=utah"
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
