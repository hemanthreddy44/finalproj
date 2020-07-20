eksctl create cluster -f cluster.yaml --kubeconfig  kubeconfig
kubectl apply -f k8s/deployment.yml
kubectl apply -f k8s/services.yml
