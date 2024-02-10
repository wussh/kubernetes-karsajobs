# Kubernetes KarsaJobs Deployment

This repository contains Kubernetes manifests for deploying the KarsaJobs application, including backend, frontend, and MongoDB components, along with monitoring resources using Prometheus and Grafana.

## Introduction
The KarsaJobs application is split into backend and frontend components, with MongoDB serving as the database. Kubernetes manifests are provided for each component to facilitate deployment.

## Prerequisites
Before deploying the KarsaJobs application, ensure you have the following:
- Kubernetes cluster configured and running
- `kubectl` CLI configured to interact with your Kubernetes cluster

## Deployment
1. **Namespace Creation**: Ensure a Kubernetes namespace named `wush` exists. If not, create it using the following command:
   ```bash
   kubectl apply -f wush.yaml
   ```

2. **Backend Deployment**:
   - Apply the backend Deployment and Service manifests:
     ```bash
     kubectl apply -f backend/
     ```

3. **Frontend Deployment**:
   - Apply the frontend Deployment and Service manifests:
     ```bash
     kubectl apply -f frontend/
     ```

4. **MongoDB Deployment**:
   - Apply the MongoDB StatefulSet, Service, ConfigMap, PersistentVolume, and PersistentVolumeClaim manifests:
     ```bash
     kubectl apply -f mongodb/
     ```

## Monitoring
Monitoring for the KarsaJobs application is set up using Prometheus and Grafana.

1. **Prometheus**:
   - Prometheus is responsible for collecting metrics from various components.
   - Access the Prometheus UI by port-forwarding the Prometheus server Service to your localhost:
     ```bash
     kubectl port-forward service/prometheus-server 9090:80 -n wush
     ```
   - Open your browser and navigate to `http://localhost:9090` to access the Prometheus UI.

2. **Grafana**:
   - Grafana provides visualization and analytics for the collected metrics.
   - Access the Grafana UI by port-forwarding the Grafana Service to your localhost:
     ```bash
     kubectl port-forward service/grafana 3000:3000 -n wush
     ```
   - Open your browser and navigate to `http://localhost:3000` to access the Grafana UI.
   - Login with default credentials (username: `admin`, password: `admin`) and configure Prometheus as a data source.

3. **Monitoring Resources**:
   - View the status of monitoring resources (Pods, Services, Deployments, etc.) using the provided `monitoring.txt` file.