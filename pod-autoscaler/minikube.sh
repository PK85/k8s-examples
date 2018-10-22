#!/usr/bin/env bash

minikube start \
    --memory 8192 \
    --cpus 4 \
    --bootstrapper=kubeadm \
    --extra-config=apiserver.authorization-mode=RBAC \
    --extra-config=apiserver.admission-control="DefaultStorageClass,LimitRanger,MutatingAdmissionWebhook,NamespaceExists,NamespaceLifecycle,ResourceQuota,ServiceAccount,ValidatingAdmissionWebhook" \
    --extra-config=apiserver.cors-allowed-origins=".*" \
    --extra-config=controller-manager.cluster-signing-cert-file="/var/lib/localkube/certs/ca.crt" \
    --extra-config=controller-manager.cluster-signing-key-file="/var/lib/localkube/certs/ca.key" \
    --kubernetes-version=v1.10.0 \
    --vm-driver=hyperkit \
    --feature-gates="MountPropagation=false"