include env.mk

check-environment-variables:
ifndef ENVIRONMENT
	$(error ENVIRONMENT is undefined)
endif

init: check-environment-variables
	$(TF) -chdir=./envs/${ENVIRONMENT} init -reconfigure -upgrade=${TF_UPGRADE}

check: init
	$(TF) -chdir=./envs/${ENVIRONMENT} plan ${TF_ARGS}

create: init
	$(TF) -chdir=./envs/${ENVIRONMENT} apply ${TF_ARGS}

update: create

delete: init
	$(TF) -chdir=./envs/${ENVIRONMENT} destroy ${TF_ARGS}

unlock: init
ifndef LOCK_ID
	$(error LOCK_ID must be provided)
endif
	$(TF) -chdir=./envs/${ENVIRONMENT} force-unlock ${LOCK_ID}