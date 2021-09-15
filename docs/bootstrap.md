# Bootstrap

## Fetch the cluster's GPG keys

```sh
export GPG_TTY=$(tty)
gpg --list-secret-keys "Kubernetes (Flux)"
export FLUX_KEY_FP=ABCDEFGHIJKLMNOPQRSTUVWXYZ
```

## Verify if the cluster is ready for Flux
```sh
flux check --pre
```

## Create the `flux-system` namespace

```sh
kubectl create namespace flux-system
```

## Add the Flux GPG key for decrypting secrets

```sh
gpg --export-secret-keys --armor "${FLUX_KEY_FP}" |
kubectl create secret generic sops-gpg \
    --namespace=flux-system \
    --from-file=sops.asc=/dev/stdin
```

## Install Flux

!!! warning "You should run this command twice because there are race conditions
on the Flux CRDs. The second run should work without errors.

```sh
kubectl apply --kustomize=./cluster/base/flux-system
```

At this point, Flux should start reconciling the cluster into the desired state.
