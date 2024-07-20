<div align="center">
<img src="https://raw.githubusercontent.com/cncf/artwork/master/projects/kubernetes/icon/color/kubernetes-icon-color.svg" alt="Kubernetes logo" width="200px" align="center" />

# My home Kubernetes cluster

</div>

<div align="center">

[![Talos](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dtalos_version&style=for-the-badge&logo=talos&logoColor=white&label=%20&color=blue)](https://talos.dev)
[![Kubernetes](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dkubernetes_version&style=for-the-badge&logo=kubernetes&logoColor=white&label=%20&color=blue)](https://talos.dev)

</div>

<div align="center">

[![Age](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_age_days&style=flat-square&logoColor=white&label=Age)](https://github.com/kashalls/kromgo/)
[![Uptime](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_uptime_days&style=flat-square&logoColor=white&label=Uptime)](https://github.com/kashalls/kromgo/)
[![Nodes](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_node_count&style=flat-square&logoColor=white&label=Nodes)](https://github.com/kashalls/kromgo/)
[![Pods](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_pod_count&style=flat-square&logoColor=white&label=Pods)](https://github.com/kashalls/kromgo/)
[![CPU](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_cpu_usage&style=flat-square&logoColor=white&label=CPU)](https://github.com/kashalls/kromgo/)
[![Memory](https://img.shields.io/endpoint?url=https%3A%2F%2Fkromgo.minuette.horse%2Fquery%3Fformat%3Dendpoint%26metric%3Dcluster_memory_usage&style=flat-square&logoColor=white&label=Memory)](https://github.com/kashalls/kromgo/)

</div>

## Overview

My home Kubernetes cluster running on [talos](https://talos.dev/), powered by [Flux](https://toolkit.fluxcd.io/).
[SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/) is used to encrypt secrets.
[Cloudflare tunnels](https://www.cloudflare.com/products/tunnel/) are used to make it all available over the internet.
And finally, [Rook](https://rook.io/) gets used to provide storage to the cluster.

## Hardware

| Device                  | Count | OS disk     | Data disk   | RAM   | OS               | Purpose     |
|-------------------------|-------|-------------|-------------|-------|------------------|-------------|
| Whitebox N100           | 1     | 1TB NVMe    | 1TB SATA    | 32 GB | Talos            | K8s master  |
| Dell Optiplex 7010 Plus | 2     | 500 GB NVMe | 1TB NVMe    | 32 GB | Talos            | K8s master  |
| Dell Optiplex 7010 Plus | 2     | 500 GB NVMe | 1TB NVMe    | 32 GB | Talos            | K8s nodes   |
| Synology DS1518+        | 1     | N/A         | 5x6 TB SATA | 4 GB  | Synology DSM 7.2 | NAS storage |

## Acknowledgements

Loosely based on the amazing work in [onedr0p/cluster-template](https://github.com/onedr0p/cluster-template) and grabbing bits and pieces found with
[k8s-at-home-search](https://nanne.dev/k8s-at-home-search/)
