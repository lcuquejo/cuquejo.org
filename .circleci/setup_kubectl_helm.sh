#!/bin/bash

GKE_CLUSTER=cuquejo
echo "Setting up helm and kubectl:"
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 && chmod 700 get_helm.sh && ./get_helm.sh
sudo apt-get install kubectl
gcloud container clusters get-credentials ${GKE_CLUSTER}