# Continuous Deployment in AWS and K8s

This image packs what is necessary for deploying services to `aws`. It provides the following scripts:

* `aws-authenticate.sh`: Authenticates in AWS. Requires `$AWS_ACCESS_KEY_ID`, `$AWS_SECRET_ACCESS_KEY` and `$AWS_REGION`

* `ecr-authenticate.sh`: Authenticates in AWS's docker registry, `ECR`. Requires `$AWS_REGION` and `aws-authenticate.sh`

* `ecr-create-build-push.sh`: Creates an `ECR` repo if doesn't exists, builds and push an image to said repo. Requires `$AWS_ECR_ACCOUNT_URL`, `$AWS_REGION` and `ecr-authenticate.sh`. Usage: `./scripts/ecr-create-build-push.sh <repo> <tag>`

* `eks-authenticate.sh`: Connects a local installation of `Kubernetes` to AWS's K8s engine, `EKS`. Requires `$AWS_REGION`, `$CLUSTER_NAME` and `aws-authenticate.sh`

# Future work

* Allow multiple tags in `ecr-create-build-push.sh`
