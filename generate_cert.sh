#!/bin/bash

#ca
cfssl gencert -initca ./k8s_yaml/cert/ca-csr.json | cfssljson -bare ca -

##harbor
cfssl gencert -ca=ca.pem -ca-key=ca-key.pem -config=./k8s_yaml/cert/ca-config.json -profile=server ./k8s_yaml/cert/harbor.json | cfssljson -bare harbor

##move file
mv -f ca.csr ca.pem ca-key.pem harbor.csr harbor-key.pem harbor.pem ./k8s_yaml/cert/

#---Create k8s secret---
kubectl create ns registry
kubectl -n registry create secret tls nginx-certificates --key=./k8s_yaml/cert/harbor-key.pem --cert=./k8s_yaml/cert/harbor.pem