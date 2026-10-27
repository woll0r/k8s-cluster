<div align="center">
<img src="https://raw.githubusercontent.com/cncf/artwork/master/projects/kubernetes/icon/color/kubernetes-icon-color.svg" alt="Kubernetes logo" width="200px" align="center" />

# My home Kubernetes cluster

</div>

<div align="center">

[![Talos](https://kromgo.minuette.horse/badges/talos_version)](https://talos.dev)
[![Kubernetes](https://kromgo.minuette.horse/badges/kubernetes_version)](https://talos.dev)
[![Flux](https://kromgo.minuette.horse/badges/flux_version)](https://fluxcd.io/)

</div>

<div align="center">

[![Age](https://kromgo.minuette.horse/badges/cluster_birth_age)](https://github.com/home-operations/kromgo)
[![Uptime](https://kromgo.minuette.horse/badges/cluster_uptime_age)](https://github.com/home-operations/kromgo)
[![Nodes](https://kromgo.minuette.horse/badges/cluster_node_count)](https://github.com/home-operations/kromgo)
[![Pods](https://kromgo.minuette.horse/badges/cluster_pod_count)](https://github.com/home-operations/kromgo)
[![CPU](https://kromgo.minuette.horse/badges/cluster_cpu_usage)](https://github.com/home-operations/kromgo)
[![Memory](https://kromgo.minuette.horse/badges/cluster_memory_usage)](https://github.com/home-operations/kromgo)

</div>

## Overview

My home Kubernetes cluster running on [talos](https://talos.dev/), powered by [Flux](https://toolkit.fluxcd.io/).
[SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/) is used to encrypt secrets.
[Cloudflare tunnels](https://www.cloudflare.com/products/tunnel/) are used to make it all available over the internet.
And finally, [Rook](https://rook.io/) gets used to provide storage to the cluster.

TODO: properly update all of this (once I get around to the network upgrades, redeploying, refactoring to use OCI repos, and other stuff I've been putting off)

## Hardware

| Device                  | Count | OS disk     | Data disk   | RAM   | OS               | Purpose     |
| ----------------------- | ----- | ----------- | ----------- | ----- | ---------------- | ----------- |
| Whitebox N100           | 1     | 1TB NVMe    | 1TB SATA    | 32 GB | Talos            | K8s master  |
| Dell Optiplex 7010 Plus | 2     | 500 GB NVMe | 1TB NVMe    | 32 GB | Talos            | K8s master  |
| Dell Optiplex 7010 Plus | 2     | 500 GB NVMe | 1TB NVMe    | 32 GB | Talos            | K8s nodes   |
| Synology DS1518+        | 1     | N/A         | 5x6 TB SATA | 4 GB  | Synology DSM 7.2 | NAS storage |

## Acknowledgements

Loosely based on the amazing work in [home-operations/cluster-template](https://github.com/home-operations/cluster-template) and grabbing bits and pieces found with
[kubesearch](https://kubesearch.dev/)
