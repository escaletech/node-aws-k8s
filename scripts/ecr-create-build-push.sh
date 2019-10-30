#!/bin/sh

export REPO=$1
export TAG=$2

# Create ECR repo if doesn't exists
aws ecr describe-repositories --region $AWS_REGION --repository-names $REPO > /dev/null 2>&1 || \
aws ecr create-repository --region $AWS_REGION --repository-name $REPO

# Builds docker image
docker build . -t "${AWS_ECR_ACCOUNT_URL}/${REPO}:${TAG}"

# Pushes to registry
docker push "${AWS_ECR_ACCOUNT_URL}/${REPO}:${TAG}"
