check-environment-variables:
ifndef ENVIRONMENT
	$(error ENVIRONMENT is undefined)
endif
