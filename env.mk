APPLICATION_NAME ?= paul_devops_demo_cicd
COST_GROUP ?= demo_cidd

TF_UPGRADE ?= false
TF_ARGS =	-var="application_name=${APPLICATION_NAME}" \
			-var="environment=${ENVIRONMENT}" \
			-var='tags={"costgroup":"${COST_GROUP}"}'
TF = TF_DATA_DIR=./envs/${ENVIRONMENT}/.terraform AWS_SDK_LOAD_CONFIG=true terraform
