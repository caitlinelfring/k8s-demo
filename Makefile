NAMESPACE = rtr
CHART = hello-world
DIR = chart
deploy:
	helm upgrade -i --namespace $(NAMESPACE) $(CHART) $(DIR)

delete:
	helm delete --purge $(CHART)

restart:
	kubectl rollout restart -n $(NAMESPACE) deployment/$(CHART)

template:
	helm template -n $(CHART) $(DIR)

port-forward:
	kubectl port-forward -n $(NAMESPACE) deployment/$(CHART) 8080:8080
.PHONY: deploy delete restart template
