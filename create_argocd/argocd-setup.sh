#!/bin/bash
NAMESPACE=$1
PROJECT=$2
REPOSITORIES=$3

# Convert repositories into list
repos=$(echo $REPOSITORIES | tr ',' ' ')

# Wait for argo cd server
sleep 30

ARGOCD_SERVER="argocd-server.${NAMESPACE}.svc.cluster.local"
ARGOCD_PASSWORD=$(cat /etc/argocd-initial-admin-secret/password)

echo "Serveur Argo CD disponible à l'adresse : $ARGOCD_SERVER"

# Login to argo cd
argocd login $ARGOCD_SERVER --username admin --password $ARGOCD_PASSWORD --insecure

# Add repositories
if [ -n "$REPOSITORIES" ]; then
    for repo_url in $repos; do
        argocd repo add $repo_url
    done
else
    echo "No repositories to add."
fi

# Create project
if [ -n "$PROJECT" ]; then

    argocd proj create $PROJECT
    echo "Project ${PROJECT} created"
else
    echo "No Project to create"
fi