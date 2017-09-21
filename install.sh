#!/usr/bin/env bash

#---Prepare Resource & Configuration Files---
bash -c ./prepare

#---Create k8s resource---
kubectl apply -f ./k8s_yaml/cm/ -n registry
kubectl apply -f ./k8s_yaml/service/ -n registry
kubectl apply -f ./k8s_yaml/secret/ -n registry
#kubectl apply -f ./k8s_yaml/pvc/ -n registry
kubectl apply -f ./k8s_yaml/deployment/ -n registry

