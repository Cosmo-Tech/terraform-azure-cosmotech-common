#!/bin/bash

NAMESPACE=$1
SECRET_NAME=$2
REPLICAS=$3

echo "Waiting for 30 seconds before starting..."
sleep 30

# Initialize Vault
init_output=$(kubectl exec vault-0 --namespace $NAMESPACE -- vault operator init -format=json)
unseal_keys=$(echo $init_output | jq -r '.unseal_keys_b64[]')
root_token=$(echo $init_output | jq -r '.root_token')

# Create a Kubernetes secret
kubectl create secret generic $SECRET_NAME --namespace $NAMESPACE \
  --from-literal=UNSEAL_KEYS="$(echo $unseal_keys | tr ' ' ',')" \
  --from-literal=ROOT_TOKEN="$root_token"

# Unseal Vault-0
for key in $unseal_keys; do
  kubectl exec vault-0 --namespace $NAMESPACE -- vault operator unseal $key
done

echo "Waiting for 30 seconds before starting..."
sleep 30

# Join raft
for i in $(seq 1 $(($REPLICAS - 1))); do
  kubectl exec vault-$i -n $NAMESPACE -- vault operator raft join http://vault-0.vault-internal:8200
done

# Unseal replicas
for i in $(seq 1 $(($REPLICAS - 1))); do
  for key in $unseal_keys; do
    kubectl exec vault-$i --namespace $NAMESPACE -- vault operator unseal $key
  done
done