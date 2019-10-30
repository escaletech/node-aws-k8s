#!/bin/sh

LOGIN_COMMAND=$(aws ecr get-login --no-include-email --region $AWS_REGION)
$LOGIN_COMMAND
