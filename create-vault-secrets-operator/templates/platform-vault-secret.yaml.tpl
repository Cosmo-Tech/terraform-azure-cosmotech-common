apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: platform-secret
  namespace: ${namespace}
spec:
  vaultAuthRef: vault-secrets-operator-vault-auth
  mount: cosmotech
  type: kv-v1
  path: platform
  refreshAfter: 10s
  destination:
    create: true
    name: platform-secret