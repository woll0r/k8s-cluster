# Bootstrap

## Create an age key

```sh
age-keygen -o age.agekey
```

## Verify if the cluster is ready for Flux
```sh
flux check --pre
```

## Create the `flux-system` namespace

```sh
kubectl create namespace flux-system
```

## Add the AGE key for decrypting secrets

```sh
cat age.agekey |
kubectl -n default create secret generic sops-age \
--from-file=age.agekey=/dev/stdin
```

## Install Flux

!!! warning "You should run this command twice because there are race conditions
on the Flux CRDs. The second run should work without errors.

```sh
kubectl apply --kustomize=./cluster/base/flux-system
```

At this point, Flux should start reconciling the cluster into the desired state.
