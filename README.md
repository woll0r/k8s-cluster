<img src="https://raw.githubusercontent.com/cncf/artwork/master/projects/kubernetes/icon/color/kubernetes-icon-color.svg" alt="Kubernetes logo" width="200px" />

# My home Kubernetes cluster
---

## Overview

My home Kubernetes cluster running on [k3s](https://k3s.io/), powered by [Flux](https://toolkit.fluxcd.io/).
[SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/) is used to encrypt secrets.
[Cloudflare tunnels](https://www.cloudflare.com/products/tunnel/) are used to make it all available over the internet.
And finally, [Rook](https://rook.io/) gets used to provide storage to the cluster.

## Setup

The cluster is stood up using an Ansible runbook that runs against the manually installed hosts. Something to properly document, improve upon and integrate into this repo in the future.

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
