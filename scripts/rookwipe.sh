#!/bin/bash

echo "Wiping Rook disks..."

# If a Ceph cluster exists, abort
if kubectl --namespace rook-ceph get helmrelease rook-ceph-cluster &>/dev/null; then
    echo "Detected a Ceph cluster! Aborting!"
    exit 1
fi

if ! nodes=$(talosctl config info --output json 2>/dev/null | jq --exit-status --raw-output '.nodes | join(" ")') || [[ -z "${nodes}" ]]; then
    echo "No nodes found!"
    exit 1
fi

echo "Nodes discovered: ${nodes}"

for node in ${nodes}; do
    if ! disks=$(talosctl --nodes "${node}" get disk --output json 2>/dev/null \
        | jq --exit-status --raw-output --slurp '. | map(select(.spec.model == env.ROOK_DISK) | .metadata.id) | join(" ")') || [[ -z "${disks}" ]];
    then
        echo "No disks of type ${ROOK_DISK} on node ${node}"
    fi

    echo "Disks of type ${ROOK_DISK} discovered on node ${node}: ${disks}"

    # Wipe each disk
    for disk in ${disks}; do
        echo "Wiping: ${node} ${disk}"
        if talosctl --nodes "${node}" wipe disk "${disk}" &>/dev/null; then
            echo "Disk wiped: ${node} ${disk}"
        else
            echo "Wipe failed: ${node} ${disk}"
        fi
    done
done
