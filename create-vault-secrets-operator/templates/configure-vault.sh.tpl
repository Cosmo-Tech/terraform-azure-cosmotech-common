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

# Vérifier si le secret engine existe, sinon le créer
if ! vault_cmd secrets list | grep -q "^${organization}/"; then
  echo "Creating ${organization} secret engine"
  vault_cmd secrets enable -path=${organization} kv-v2
else
  echo "${organization} secret engine already exists"
fi

# Créer des politiques et des rôles pour chaque namespace autorisé
%{ for namespace in allowed_namespaces ~}
NAMESPACE_POLICY='
path "${organization}/data/${tenant_id}/clusters/${cluster_name}/${namespace}-platform-secrets" { capabilities = ["read", "list"] }
path "${organization}/metadata/${tenant_id}/clusters/${cluster_name}/${namespace}-platform-secrets" { capabilities = ["read", "list"] } 
path "${organization}/data/${tenant_id}/clusters/${cluster_name}/${namespace}-platform-secrets/*" { capabilities = ["read", "list"] }
path "${organization}/metadata/${tenant_id}/clusters/${cluster_name}/${namespace}-platform-secrets/*" { capabilities = ["read", "list"] }
'
echo "$NAMESPACE_POLICY" | vault_cmd policy write ${namespace}-policy -

vault_cmd write auth/kubernetes/role/${namespace}-role \
  bound_service_account_names=default \
  bound_service_account_namespaces=${namespace} \
  policies=${namespace}-policy \
  ttl=1h
%{ endfor ~}

echo "Vault configuration completed successfully."