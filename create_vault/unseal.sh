#!/bin/bash

NAMESPACE=$1
SECRET_NAME=$2
REPLICAS=$3

# Check if required parameters are provided
if [ -z "$NAMESPACE" ] || [ -z "$SECRET_NAME" ] || [ -z "$REPLICAS" ]; then
    echo "Error: All parameters (NAMESPACE, SECRET_NAME, REPLICAS) are required"
    exit 1
fi

# Check if REPLICAS is a positive integer
if ! [[ "$REPLICAS" =~ ^[1-9][0-9]*$ ]]; then
    echo "Error: REPLICAS must be a positive integer"
    exit 1
fi

# Function to check if all Vault pods are running
check_vault_pods() {
    for i in $(seq 0 $(($REPLICAS - 1))); do
        status=$(kubectl get pod vault-$i -n $NAMESPACE -o jsonpath='{.status.phase}')
        if [ "$status" != "Running" ]; then
            return 1
        fi
    done
    return 0
}

# Wait for Vault pods to be running
echo "Waiting for all Vault pods to be in Running state..."
while ! check_vault_pods; do
    echo "Waiting for Vault pods..."
    sleep 10
done
echo "All Vault pods are running."

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
  echo "replica $i unsealed"
done

echo "Waiting for 30 seconds before starting..."
sleep 30

# Output token and pods state
echo "Raft list-peers output:"
kubectl exec vault-0 --namespace $NAMESPACE -- vault login $root_token
kubectl exec vault-0 --namespace $NAMESPACE -- vault operator raft list-peers