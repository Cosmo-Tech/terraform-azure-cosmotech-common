#!/bin/bash

NAMESPACE=$1
SECRET_NAME=$2

# Initialize Vault
init_output=$(kubectl exec -it vault-0 --namespace $NAMESPACE -- vault operator init -format=json)
unseal_keys=$(echo $init_output | jq -r '.unseal_keys_b64[]')
root_token=$(echo $init_output | jq -r '.root_token')

# Unseal Vault
for key in $unseal_keys; do
  kubectl exec -it vault-0 --namespace $NAMESPACE -- vault operator unseal $key
  kubectl exec -it vault-1 --namespace $NAMESPACE -- vault operator unseal $key
  kubectl exec -it vault-2 --namespace $NAMESPACE -- vault operator unseal $key
done

# Create a Kubernetes secret
kubectl create secret generic $SECRET_NAME --namespace $NAMESPACE \
  --from-literal=UNSEAL_KEYS="$(echo $unseal_keys | tr ' ' ',')" \
  --from-literal=ROOT_TOKEN="$root_token"