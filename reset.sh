#!/usr/bin/env bash

#---Uninstall Harbor Kubernetes---

kubectl delete -f ./k8s_yaml/cm/ -n registry
kubectl delete -f ./k8s_yaml/deployment/ -n registry
kubectl delete -f ./k8s_yaml/service/ -n registry
kubectl delete -f ./k8s_yaml/secret/ -n registry
#kubectl delete -f ./k8s_yaml/pvc/ -n registry

kubectl -n registry delete secret nginx-certificates