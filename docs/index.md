# K8S-GitOps

!!! warning
    These docs haven't been touched in a while, so they might be out of date.

This repository serves as the declarative "source of truth" for my Kubernetes
cluster at home. [Flux] watches over the
`cluster` folder to check for changes and apply them to the cluster.

The [flux-cluster-template] repository served
as a loose base for things.

[Flux]: https://github.com/fluxcd/flux2
[flux-cluster-template]: https://github.com/onedr0p/flux-cluster-template
