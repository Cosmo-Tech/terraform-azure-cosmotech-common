apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: argocd-setup-binding
  namespace: ${NAMESPACE}
subjects:
- kind: ServiceAccount
  name: argocd-setup
  namespace: ${NAMESPACE}
roleRef:
  kind: Role
  name: argocd-setup-role
  apiGroup: rbac.authorization.k8s.io