#!/bin/sh

# Authenticates kubectl in EKS
aws eks --region $AWS_REGION update-kubeconfig --name $CLUSTER_NAME
