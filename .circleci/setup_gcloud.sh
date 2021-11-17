#!/bin/bash

if [ -n "$GCLOUD_SERVICE_KEY" ]; then
    echo "Setup gcloud:"
    sudo apt-get install -y apt-transport-https ca-certificates gnupg
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk
    echo $GCLOUD_SERVICE_KEY > ${HOME}/gcloud-service-key.json
    gcloud auth activate-service-account --key-file=${HOME}/gcloud-service-key.json
    gcloud --quiet config set project $GOOGLE_PROJECT_ID
    gcloud --quiet config set compute/zone $GOOGLE_COMPUTE_ZONE
    gcloud --quiet config set compute/region $GOOGLE_COMPUTE_REGION
else
    echo "Missing GCLOUD_SERVICE_KEY"
    exit 1
fi