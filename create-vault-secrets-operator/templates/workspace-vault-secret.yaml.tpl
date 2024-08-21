apiVersion: secrets.hashicorp.com/v1beta1
kind: VaultStaticSecret
metadata:
  name: ${namespace}-workspace-secrets
  namespace: ${namespace}
spec:
  vaultAuthRef: ${namespace}-vault-auth
  mount: ${organization}
  type: kv-v2
  path: ${tenant_id}/clusters/${cluster_name}/${namespace}/workspaces/${organization_id}-${workspace_key}
  refreshAfter: 10s
  destination:
    create: true
    name: ${organization_id}-${workspace_key}