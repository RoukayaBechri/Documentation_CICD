---
sidebar_position: 1
---

1- Add the Prometheus Helm chart repository from prometheus-community:
```bash
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```
2- Install Prometheus using the Helm chart. We provided the chart values customized for our needs, but you can make your changes as you wish. Specify the custom values file with -f flag:

```bash
helm install prometheus prometheus-community/prometheus -n monitoring --create-namespace -f prometheus_values.yaml --version 19.0.0
```

This will deploy Prometheus in your Kubernetes cluster using the specified configuration in values.yaml file.


