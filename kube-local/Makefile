start:
	./start.sh

gcloud-auth:
	kubectl create clusterrolebinding cluster-admin-binding \
		--clusterrole=cluster-admin \
		--user=ColinWalker270@gmail.com

setup:
	helm --kube-context minikube init
	kubectl --context minikube apply -f registry.yaml

registry-proxy:
	pod_id=$$(kubectl -n kube-system get pods | grep 'registry' | awk '{print $$1}') && \
	kubectl -n kube-system port-forward $$pod_id 5000:5000

