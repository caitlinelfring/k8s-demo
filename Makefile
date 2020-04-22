NAMESPACE = default
CHART = hello-world
DIR = charts/$(CHART)
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

helm-init:
	kubectl apply -f helm-init.yaml
	helm init --service-account tiller
	kubectl wait --for=condition=Ready --timeout=300s pod -l app=helm,name=tiller --namespace kube-system

nginx:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/mandatory.yaml
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.30.0/deploy/static/provider/cloud-generic.yaml

watch:
	watch "kubectl get pods -A --sort-by=status.startTime | awk 'NR<2{print \$$0;next}{print \$$0| \"tail -r\"}'"

.PHONY: deploy delete restart template helm-init nginx watch
