include env.mk
include check.mk

init: check-environment-variables
	$(TF) init -reconfigure -upgrade=${TF_UPGRADE} ./envs/${ENVIRONMENT}

check: init
	$(TF) plan ${TF_ARGS} ./envs/${ENVIRONMENT}

create: init
	$(TF) apply ${TF_ARGS} ./envs/${ENVIRONMENT}

update: create

delete: init
	$(TF) destroy ${TF_ARGS} ./envs/${ENVIRONMENT}

unlock: init
ifndef LOCK_ID
	$(error LOCK_ID must be provided)
endif
	$(TF) force-unlock ${LOCK_ID} ./envs/${ENVIRONMENT}