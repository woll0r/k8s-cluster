# K8S-GitOps

This repository serves as the declarative "source of truth" for my Kubernetes
cluster at home. [Flux](flux) watches over the
[cluster](./cluster/) folder to check for changes and apply them to the cluster.

The [k8s-at-home/template-cluster-k3s](k8s-at-home-template) repository served
as a loose base for things.



[flux]: https://github.com/fluxcd/flux2
[k8s-at-home-template]: https://github.com/k8s-at-home/template-cluster-k3s
