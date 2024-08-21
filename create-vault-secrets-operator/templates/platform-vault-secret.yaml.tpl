apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: ${namespace}-platform-secrets
  namespace: ${namespace}
spec:
  vaultAuthRef: ${namespace}-vault-auth
  mount: ${organization}
  type: kv-v2
  path: ${tenant_id}/clusters/${cluster_name}/${namespace}-platform-secrets
  refreshAfter: 10s
  destination:
    create: true
    name: ${namespace}-platform-secrets