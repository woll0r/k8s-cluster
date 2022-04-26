<img src="https://raw.githubusercontent.com/cncf/artwork/master/projects/kubernetes/icon/color/kubernetes-icon-color.svg" width="200px" />

# My home Kubernetes cluster

[![GitHub Workflow Status (event)](https://img.shields.io/github/workflow/status/woll0r/k8s-cluster/MegaLinter?event=push&logo=githubactions&logoColor=white&label=MegaLinter&style=for-the-badge)](https://github.com/Woll0r/k8s-cluster/actions/workflows/mega-linter.yml)
[![GitHub branch checks state](https://img.shields.io/github/checks-status/woll0r/k8s-cluster/main?logo=github&style=for-the-badge)](https://github.com/woll0r/k8s-cluster/)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white&style=for-the-badge)](https://github.com/pre-commit/pre-commit)
[![k3s](https://img.shields.io/badge/K3S-v1.23-brightgreen?logo=kubernetes&logoColor=white&style=for-the-badge)](https://k3s.io)

My home K8S cluster running on [k3s](https://k3s.io/), powered by
[Flux](https://toolkit.fluxcd.io/) with
[SOPS](https://toolkit.fluxcd.io/guides/mozilla-sops/) for encrypting secrets.

Loosely based on the amazing work in
[k8s-at-home/template-cluster-k3s](https://github.com/k8s-at-home/template-cluster-k3s)
