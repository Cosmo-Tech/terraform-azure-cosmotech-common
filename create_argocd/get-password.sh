#!/bin/bash

namespace=$1
secret_name="argocd-initial-admin-secret"

# Get the initial admin password
password=$(kubectl -n $namespace get secret $secret_name -o jsonpath="{.data.password}" | base64 --decode)