---
apiVersion: v1
kind: ConfigMap
metadata:
  name: ${name}
  namespace: ${namespace}
data:
  %{ for key, value in kvs }
  ${key}: ${value}
  %{ endfor ~}