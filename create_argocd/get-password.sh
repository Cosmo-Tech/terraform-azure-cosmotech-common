#!/bin/bash
set -e

namespace=$1
secret_name="argocd-initial-admin-secret"

# Check if namespace is provided
if [ -z "$namespace" ]; then
    echo "Error: Namespace is required"
    exit 1
fi

# Get the initial admin password
password=$(kubectl -n $namespace get secret $secret_name -o jsonpath="{.data.password}" | base64 --decode)

echo "Password retrieved successfully"