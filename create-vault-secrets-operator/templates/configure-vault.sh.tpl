#!/bin/bash
set -e

echo "Starting Vault configuration script"

# Fonction pour exécuter des commandes Vault
vault_cmd() {
  kubectl exec -i vault-0 -n $VAULT_NAMESPACE -- vault "$@"
}

# Attendre que Vault soit prêt
until kubectl get pods -n $VAULT_NAMESPACE | grep vault-0 | grep -q Running; do
  echo "Waiting for Vault to be ready..."
  sleep 5
done

# Configurer l'authentification Kubernetes si ce n'est pas déjà fait
if ! vault_cmd auth list | grep -q kubernetes; then
  vault_cmd auth enable kubernetes
fi

# Configurer l'authentification Kubernetes
vault_cmd write auth/kubernetes/config \
  kubernetes_host="https://$KUBERNETES_SERVICE_HOST:$KUBERNETES_SERVICE_PORT" \
  kubernetes_ca_cert="$(cat /var/run/secrets/kubernetes.io/serviceaccount/ca.crt)" \
  token_reviewer_jwt="$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)" \
  disable_iss_validation=true

# Vérifier si le secret engine cosmotech existe, sinon le créer
if ! vault_cmd secrets list | grep -q '^cosmotech/'; then
  echo "Creating cosmotech secret engine"
  vault_cmd secrets enable -path=cosmotech kv-v2
else
  echo "cosmotech secret engine already exists"
fi

# Créer ou mettre à jour les secrets pour platform et workspace
echo "Creating/updating platform secret"
vault_cmd kv put -mount=cosmotech platform dummy=value

echo "Creating/updating workspace secret"
vault_cmd kv put -mount=cosmotech workspace dummy=value

# Créer une politique pour les secrets de la plateforme et de l'espace de travail
GLOBAL_POLICY='path "cosmotech/platform/*" { capabilities = ["read", "list"] } path "cosmotech/workspace/*" { capabilities = ["read", "list"] } path "cosmotech/data/platform/*" { capabilities = ["read", "list"] } path "cosmotech/data/workspace/*" { capabilities = ["read", "list"] }'
echo "$GLOBAL_POLICY" | vault_cmd policy write global-secrets -

# Créer un rôle pour l'opérateur Vault Secrets
vault_cmd write auth/kubernetes/role/vault-secrets-operator \
  bound_service_account_names=vault-secrets-operator \s
  bound_service_account_namespaces=${VAULT_SECRETS_OPERATOR_NAMESPACE} \
  policies=global-secrets \
  ttl=1h

# Créer des politiques et des rôles pour chaque namespace autorisé
%{ for namespace in allowed_namespaces ~}
NAMESPACE_POLICY='path "cosmotech/${namespace}/*" { capabilities = ["read", "list"] }'
echo "$NAMESPACE_POLICY" | vault_cmd policy write ${namespace}-policy -

vault_cmd write auth/kubernetes/role/${namespace}-role \
  bound_service_account_names=default \
  bound_service_account_namespaces=${namespace} \
  policies=${namespace}-policy,global-secrets \
  ttl=1h
%{ endfor ~}

echo "Vault configuration completed successfully."