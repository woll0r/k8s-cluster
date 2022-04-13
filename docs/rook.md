# Rook

## Directly interacting with the Ceph cluster

Open up a shell in the `rook-ceph-direct-mount` pod.

```shell
kubectl exec -it -n rook-ceph rook-direct-mount-5fd4b8d8c5-8sd9q -- bash
```

In this shell, all Ceph commands can be executed.

## Directly mounting a volume

First, suspend the HelmRelease and scale down the deployment so the storage is
not in use.

```shell
flux suspend helmrelease -n media bazarr
kubectl scale deployment -n media bazarr --replicas 0
```

Next step is extracting the `csi-vol-*` string from the PersistentVolume.

```shell
kubectl get pv/$(kubectl get pv | grep bazarr-config \
    | awk -F' ' '{print $1}') -n home -o json \
    | jq -r '.spec.csi.volumeAttributes.imageName'
```

After this, connect to the `rook-ceph-direct-mount` pod, create a mount path
and map the volume.

```shell
mkdir -p /mnt/data
rbd map -p replicapool csi-vol-d72a57f3-1370-11ec-aa8b-babccd65caf2 \
    | xargs -I{} mount {} /mnt/data
```

Afterwards, unmount and unmap the volume.

```shell
umount /mnt/data
rbd unmap -p replicapool csi-vol-d72a57f3-1370-11ec-aa8b-babccd65caf2
```

## Correcting cluster health issues

Whenever a health issue occurs, usually the solution and/or troubleshooting
steps can be found in the [Ceph docs].

[Ceph docs]: https://docs.ceph.com/en/pacific/rados/operations/health-checks/
