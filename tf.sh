#!/bin/bash

## to execute this script run first: $ chmod +x tf.sh
## then ./tf.sh init

# make sure that all mandatory parameters are set
if [ -z "$AWS_PROFILE" ]
then
    echo "AWS_PROFILE is not defined. Please execute first: $ export AWS_PROFILE=your_profile_name"
    exit 1
fi

if [ -z "$AWS_DEFAULT_REGION" ]
then
    echo "AWS_DEFAULT_REGION is not defined. Please execute first: $ export AWS_DEFAULT_REGION='ap-southeast-2'"
    exit 1
fi

if [ -z "$ENVIRONMENT" ]
then
    echo "ENVIRONMENT is not defined. Please execute first: $ export ENVIRONMENT=dev"
    exit 1
fi

APPLICATION_NAME=paul-devops-demo-cicd
COST_GROUP=demo-cicd
TF_UPGRADE=false

TF_ARGS="-var=\"application_name=${APPLICATION_NAME}\" -var=\"environment=${ENVIRONMENT}\" -var=\"tags={\"costgroup\":\"${COST_GROUP}\"}"
TF="AWS_SDK_LOAD_CONFIG=true terraform"

if [ "$1" = "init" ]
then
  ${TF} -chdir=./envs/"${ENVIRONMENT}" init -reconfigure -upgrade=$TF_UPGRADE
elif [ "$1" = "check" ]
then
  ${TF} -chdir=./envs/"${ENVIRONMENT}" plan "${TF_ARGS}"
elif [ "$1" = "create" ]
then
  $(TF) -chdir=./envs/"${ENVIRONMENT}" apply "${TF_ARGS}"
elif [ "$1" = "delete" ]
then
  $(TF) -chdir=./envs/"${ENVIRONMENT}" destroy "${TF_ARGS}"
elif [ "$1" = "unlock" ]
then
  if [ -z "$LOCK_ID" ]
  then
    echo "LOCK_ID must be provided."
    exit 1
  else
    $(TF) -chdir=./envs/"${ENVIRONMENT}" force-unlock "${LOCK_ID}"
  fi
else
    echo "Please provide one of the following arguments: init, check, create, delete, unlock."
    exit 1
fi
