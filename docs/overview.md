# Detailed overview

## Cluster setup

The cluster runs [k3s] on top of Ubuntu 21.04 using the Ansible role from [ansible-role-k3s]. It runs semi-hyperconverged, with storage
and workloads sharing machines and NFS on a NAS for larger files.

## Components

- [Calico]: for internal networking for the cluster using BGP.
- [Rook]: Persistent volumes using Ceph RBD storage.
- [Mozilla SOPS]: Encryption of secrets.
- [external-dns]: Create DNS entries in [Cloudflare] DNS for access through a [Cloudflare tunnel].
- [cert-manager]: Provides the TLS certificates for the ingresses.
- [kube-vip]: HA for the control plane, inside the cluster.

## Structure

Under the `cluster` directory, the following structure is present for
[flux] to apply:

- **base** is the entrypoint for Flux
- **apps** contains the applications that run inside the cluster

## Automation

- Github actions check for code formatting, build docs and some other very important background tasks on Git changes.
- [System Upgrade Controller] will automatically update k3s.
- [Kured] automatically reboots the nodes whenever reboots are required for OS updates.
- [Renovate] will automatically open pull requests for new versions of Helm charts and container images, with some help from the [k8s-at-home Github action] for annotations.

[k3s]: https://k3s.io/
[ansible-role-k3s]: https://github.com/PyratLabs/ansible-role-k3s/
[Calico]: https://docs.tigera.io/calico/latest/about/about-calico/
[Rook]: https://rook.io/
[Mozilla SOPS]: https://toolkit.fluxcd.io/guides/mozilla-sops/
[external-dns]: https://github.com/kubernetes-sigs/external-dns/
[Cloudflare]: https://cloudflare.com/
[Cloudflare tunnel]: https://www.cloudflare.com/products/tunnel/
[cert-manager]: https://cert-manager.io/docs/
[kube-vip]: https://kube-vip.io/
[flux]: https://github.com/fluxcd/flux2/
[System Upgrade Controller]: https://github.com/rancher/system-upgrade-controller/
[Kured]: https://github.com/weaveworks/kured/
[Renovate]: https://github.com/renovatebot/renovate/
[k8s-at-home Github action]: https://github.com/k8s-at-home/renovate-helm-releases/
