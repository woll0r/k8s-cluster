# Detailed overview

## Cluster setup

The cluster runs [k3s](k3s) on top of Ubuntu 21.04 using the Ansible role from
[ansible-role-k3s](ansible-role-k3s). It runs semi-hyperconverged, with storage
and workloads sharing machines and NFS on a NAS for larger files.

## Components

- [Calico](calico): for internal networking for the cluster using BGP.
- [Rook](rook): Persistent volumes using Ceph RBD storage.
- [Mozilla SOPS](sops): Encryption of secrets.
- [external-dns](external-dns): Create DNS entries in a [coredns](coredns)
deployment for use outside the cluster.
- [cert-manager](cert-manager): Provides the TLS certificates for the ingresses.
- [kube-vip](kube-vip): HA for the control plane, inside the cluster.

## Structure

Under the `cluster` directory, the following structure is present for
[flux](flux) to apply:

- **base** is the entrypoint for Flux
- **crds** contains the custom resource definitions (CRDs) that need to exist
for other parts of the cluster to exist
- **core** has all the important core components that should be present, such as
storage, with a dependency on **crds**
- **apps** contains the applications that run inside the cluster, with a
dependency on **core**

## Automation

- [Github actions](gh-actions) check for code formatting, build docs and some
other very important background tasks on Git changes.
- [System Upgrade Controller](system-upgrade-controller) will automatically
update k3s.
- [Kured](kured) automatically reboots the nodes whenever reboots are required
for OS updates.
- [Renovate](renovate) will automatically open pull requests for new versions
of Helm charts and container images, with some help from the
[k8s-at-home Github action](k8s-at-home-gh-action) for annotations.

[k3s]: https://k3s.io
[ansible-role-k3s]: https://github.com/PyratLabs/ansible-role-k3s
[calico]: https://docs.projectcalico.org/about/about-calico
[rook]: https://rook.io/
[sops]: https://toolkit.fluxcd.io/guides/mozilla-sops/
[external-dns]: https://github.com/kubernetes-sigs/external-dns
[coredns]: https://github.com/coredns/coredns
[cert-manager]: https://cert-manager.io/docs/
[kube-vip]: https://kube-vip.io/
[gh-actions]: https://docs.github.com/en/actions
[system-upgrade-controller]: https://github.com/rancher/system-upgrade-controller
[kured]: https://github.com/weaveworks/kured
[renovate]: https://github.com/renovatebot/renovate
[k8s-at-home-gh-action]: https://github.com/k8s-at-home/renovate-helm-releases
