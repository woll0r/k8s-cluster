<img src="https://raw.githubusercontent.com/cncf/artwork/master/projects/kubernetes/icon/color/kubernetes-icon-color.svg" width="200px" />

# My home Kubernetes cluster

![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/woll0r/k8s-cluster/mega-linter.yml?branch=main&label=Megalinter&logo=githubactions&logoColor=white&style=for-the-badge)
![GitHub branch checks state](https://img.shields.io/github/checks-status/woll0r/k8s-cluster/main?logo=github&style=for-the-badge)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![k3s](https://img.shields.io/badge/v1.26-brightgreen?logo=kubernetes&logoColor=white&style=for-the-badge)](https://k3s.io)

---

## Overview

My home Kubernetes cluster running on [k3s](https://k3s.io/), powered by [Flux](https://toolkit.fluxcd.io/).
[SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/) is used to encrypt secrets.
[Cloudflare tunnels](https://www.cloudflare.com/products/tunnel/) are used to make it all available over the internet.
And finally, [Rook](https://rook.io/) gets used to provide storage to the cluster.

## Setup

The cluster is stood up using an Ansible runbook that runs against the manually installed hosts. Something to properly document, improve upon and integrate into this repo in the future.

## Hardware

| Device            | Count | OS disk     | Data disk   | RAM   | OS               | Purpose     |
| ----------------- | ----- | ----------- | ----------- | ----- | ---------------- | ----------- |
| Whitebox i7-6700K | 1     | 250 GB NVMe | 250 GB SATA | 32 GB | Ubuntu 20.04     | K8s master  |
| Intel NUC5i3BEH   | 2     | 120 GB NVMe | 250 GB SATA | 16 GB | Ubuntu 20.04     | K8s nodes   |
| Intel NUC6CAYH    | 2     | 120 GB SATA | 250 GB SATA | 8 GB  | Ubuntu 20.04     | K8s nodes   |
| Synology DS1518+  | 1     | N/A         | 5x6 TB SATA | 4 GB  | Synology DSM 7.1 | NAS storage |

## Acknowledgements

Loosely based on the amazing work in [onedr0p/flux-cluster-template](https://github.com/onedr0p/flux-cluster-template) and grabbing bits and pieces found with
[k8s-at-home-search](https://nanne.dev/k8s-at-home-search/)
