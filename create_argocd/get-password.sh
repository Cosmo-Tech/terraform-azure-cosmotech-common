#!/bin/bash
set -e

namespace=$1
secret_name="argocd-initial-admin-secret"

# Check if namespace is provided
if [ -z "$namespace" ]; then
    echo "Error: Namespace is required"
    exit 1
fi

# Check if the secret exists
if ! kubectl get secret -n $namespace $secret_name &> /dev/null; then
    echo "Error: Secret $secret_name not found in namespace $namespace"
    exit 1
fi

# Get the initial admin password
password=$(kubectl -n $namespace get secret $secret_name -o jsonpath="{.data.password}" | base64 --decode)

# Check if password is empty
if [ -z "$password" ]; then
    echo "Error: Failed to retrieve password from secret"
    exit 1
fi

echo "Password retrieved successfully"