#!/bin/bash
set -e

SECRET_NAME="pull-secret"
NAMESPACE="openshift-config"

command -v jq >/dev/null 2>&1 || { echo >&2 "jq is required but not installed."; exit 1; }
command -v kubectl >/dev/null 2>&1 || { echo >&2 "kubectl is required but not installed."; exit 1; }

echo "Fetching existing .dockerconfigjson from secret..."
oc get secret $SECRET_NAME -n $NAMESPACE -o jsonpath='{.data.\.dockerconfigjson}' | base64 --decode > current_auth.json || echo '{}' > current_auth.json

echo "Merging authentication data..."
jq -s '.[0] * .[1]' current_auth.json brew_auth.json > merged_auth.json

echo "Updating Kubernetes secret..."
oc set data secret/${SECRET_NAME} -n ${NAMESPACE} --from-file=.dockerconfigjson=merged_auth.json

echo "Secret updated successfully."
