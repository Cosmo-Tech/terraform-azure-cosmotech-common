apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultAuth
metadata:
  name: ${namespace}-vault-auth
  namespace: ${namespace}
spec:
  method: kubernetes
  mount: kubernetes
  kubernetes:
    role: ${namespace}-role
    serviceAccount: default
  vaultConnectionRef: vault-connection