# OpenShift Sandboxed Containers Scenarios

This folder holds `ApplicationSets` for deploying OpenShift Sandboxed
Containers under different configurations (baremetal, cloud, confidential or
not) using ArgoCD.

The goal is to provide a set of reusable easy to modify templates for deploying
our operators and applications in different environments with minimal effort.

Use these to:

  * Align cluster configurations across test/demo environments
  * Toggle settings declaratively
  * Maintain consistency with minimal drift


| Scenario | Environment | Isolation |
|----------|-------------|-----------|
| **osc-baremetal**<br>Deploys OpenShift Sandboxed Containers on baremetal using Kata runtime. | Baremetal | Sandboxed only |
| **osc-coco-baremetal**<br>Deploys OpenShift Sandboxed Containers on baremetal with Confidential Containers enabled. | Baremetal | Confidential Containers |
| **osc-cloud**<br>Deploys OpenShift Sandboxed Containers on a cloud provider using kata-remote with PeerPods. | Cloud | Sandboxed only |
| **osc-coco-cloud**<br>Deploys OpenShift Sandboxed Containers on a cloud provider with Confidential Containers enabled. | Cloud | Confidential Containers |


Each scenario uses different set of charts from the same repository but with
different values. And we are avoiding replicating the OSC configuration into
values.yaml files to keep the configuration easy to use and maintainable.

For additional parameters, you can see the `values.yaml` files in each chart
that is used by the `ApplicationSet`.

Some understanding of ArgoCD is required to use these scenarios. You can find
more information about ArgoCD in the [ArgoCD documentation](https://argo-cd.readthedocs.io/en/stable/).

ArgoCD is used to manage the deployment of these scenarios, and it will only
use the helm template system to render the charts.
