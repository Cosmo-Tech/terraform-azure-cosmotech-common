apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: workspace-secret
  namespace: ${namespace}
spec:
  vaultAuthRef: vault-secrets-operator-vault-auth
  mount: cosmotech
  type: kv-v1
  path: workspace
  refreshAfter: 10s
  destination:
    create: true
    name: workspace-secret