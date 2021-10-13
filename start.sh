#!/bin/bash

minikube start --memory=8192 --cpus=4 --kubernetes-version=v1.16.1

./scripts/pulsar/prepare_helm_release.sh \
    -n default \
    -k pulsar-mini \
    -c

helm install \
    --values examples/values-minikube.yaml \
    --set initialize=true \
    --namespace default \
    pulsar-mini ./charts/pulsar
