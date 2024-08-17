apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultAuth
metadata:
  name: vault-secrets-operator-vault-auth
  namespace: ${namespace}
spec:
  method: kubernetes
  mount: kubernetes
  kubernetes:
    role: vault-secrets-operator
    serviceAccount: vault-secrets-operator
  vaultConnectionRef: vault-connection