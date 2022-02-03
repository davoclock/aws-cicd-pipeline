APPLICATION_NAME ?= paul-devops-demo-cicd
COST_GROUP ?= demo-cicd

TF_UPGRADE ?= false
TF_ARGS =	-var="application_name=${APPLICATION_NAME}" \
			-var="environment=${ENVIRONMENT}" \
			-var='tags={"costgroup":"${COST_GROUP}"}'
TF = AWS_SDK_LOAD_CONFIG=true terraform
