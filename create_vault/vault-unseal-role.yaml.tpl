apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: vault-unseal-role
  namespace: ${NAMESPACE}
rules:
- apiGroups: [""]
  resources: ["pods", "pods/log", "secrets"]
  verbs: ["get", "list", "create", "watch"]
- apiGroups: [""]
  resources: ["pods/exec"]
  verbs: ["create"]