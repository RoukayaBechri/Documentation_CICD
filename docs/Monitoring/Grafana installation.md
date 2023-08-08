---
sidebar_position: 2
---

1- Add the Grafana Helm repository::
```bash
helm repo add grafana https://grafana.github.io/helm-charts 
```
2- Install Grafana using the Helm Chart. We provided a customized grafana_values.yaml file for our specific needs, but you can modify it according to your preferences:

```bash
helm install prometheus prometheus-community/prometheus -n monitoring --create-namespace -f prometheus_values.yaml --version 19.0.0
```

1. Get your 'admin' user password by running:

   kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


2. The Grafana server can be accessed via port 80 on the following DNS name from within your cluster:

   grafana.monitoring.svc.cluster.local

This will deploy Prometheus in your Kubernetes cluster using the specified configuration in values.yaml file.


