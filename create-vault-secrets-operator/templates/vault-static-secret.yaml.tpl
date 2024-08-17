apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: ${namespace}-secrets
  namespace: ${namespace}
spec:
  vaultAuthRef: ${namespace}-vault-auth
  mount: cosmotech
  type: kv-v2
  path: ${namespace}/secrets
  destination:
    create: true
    name: ${namespace}-secrets