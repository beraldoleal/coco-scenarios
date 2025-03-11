#!/bin/bash
#
# source utils/gcp-get-values.sh
#
# The following values are going to be set, from infrastructure cluster object:
#  - GCP_PROJECT_ID
#  - GCP_REGION
#  - GCP_NETWORK
export GCP_PROJECT_ID=$(oc get infrastructure cluster -o json | jq -r '.status.platformStatus.gcp.projectID')
export GCP_REGION=$(oc get infrastructure cluster -o json | jq -r '.status.platformStatus.gcp.region')
export GCP_NETWORK=$(oc get machine -n openshift-machine-api -o jsonpath="{.items[?(@.status.nodeRef)].spec.providerSpec.value.networkInterfaces[0].network}" | head -n 1)
