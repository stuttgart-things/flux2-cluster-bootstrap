---
apiVersion: v1
kind: Secret
metadata:
  name: ${name}
  namespace: ${namespace}
stringData:
  %{ for key, value in kvs }
  ${key}: ${value}
  %{ endfor ~}