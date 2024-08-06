apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: vault-unseal-binding
  namespace: ${NAMESPACE}
subjects:
- kind: ServiceAccount
  name: vault-unseal
  namespace: ${NAMESPACE}
roleRef:
  kind: Role
  name: vault-unseal-role
  apiGroup: rbac.authorization.k8s.io