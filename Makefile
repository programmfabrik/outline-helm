EXTRA_ARGS ?= ""

# dep-install: installs dependencies needed to execute "ct"
dep-install:
	pip3 install yamale
	pip3 install --user yamllint

# updates helm dependencies
update:
	cd charts/outline && \
	helm dependency update

# install: installs the chart into the current selected Kubernetes cluster
install:
	ct install \
		--charts charts/* \
		--chart-dirs charts/ \
		--debug \
		${EXTRA_ARGS}

# lint: lints the chart
lint:
	ct lint \
		--charts charts/* \
		--chart-dirs charts/ \
		--chart-yaml-schema config/chart_schema.yaml \
		--lint-conf config/lintconf.yaml \
		--debug \
		${EXTRA_ARGS}

# using helm install to install the chart into the current selected Kubernetes cluster
local-install:
	helm install outline charts/outline \
		--namespace outline \
		--create-namespace \
		-f charts/outline/values.yaml