#!/usr/bin/env bash

# Docs @ https://rancher.com/blog/2020/upgrade-k3s-kubernetes-cluster-system-upgrade-controller

# Apply controller
kubectl apply -f system-upgrade-controller.yml

# Get status
kubectl get all -n system-upgrade4

#Set the Node Labels
kubectl label node nuc1 node-role.kubernetes.io/master=true
kubectl label node worker-01 k3s-upgrade=true

# Apply plan
kubectl apply -f upgrade-plan.yml