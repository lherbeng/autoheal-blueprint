# ***Creating Alerts in Grafana***

***When you install Grafana using Helm, the Helm chart deploys Grafana along with its default configuration. To edit the grafana.ini configuration file for Grafana deployed via Helm, you should follow these steps:***

1. Locate the Helm Chart Values: Find the Helm chart values file (often named values.yaml) that you used when you installed Grafana. This file contains configuration options that can be customized, including settings for Grafana.

2. Edit the Helm Chart Values: Open the values.yaml file in a text editor or code editor. Look for the section related to Grafana configuration. It might be under a key like grafana or grafanaConfig. If you can't find a specific section for Grafana configuration, check the chart's documentation for the exact key or how to customize Grafana settings.

3. Modify Grafana Configuration Settings: In the values.yaml file, you can specify the settings you want to modify in the grafana.ini file. Customize the settings according to your requirements. For example:

Replace the above example with the specific Grafana configuration settings you wish to change.

4. Apply the Changes: After editing the values.yaml file, save your changes. To apply the new configuration to your Grafana deployment, use the helm upgrade command:

helm upgrade RELEASE_NAME prometheus-community/kube-prometheus-stack --namespace onprem-monitoring -f values.yaml

- RELEASE_NAME: The name of your Helm release.
- prometheus-community/kube-prometheus-stack: The Helm chart repository and chart name.
- --namespace onprem-monitoring: The namespace where Grafana is deployed.
- -f values.yaml: Specifies the custom values file you edited.

5. Verify the Changes: Wait for Helm to update your Grafana deployment. You can monitor the progress by checking the pods:

kubectl get pods -n onprem-monitoring

Once the deployment is updated, you can access Grafana via the web UI and verify that the changes you made to the grafana.ini configuration have taken effect.

By following these steps, you can edit the grafana.ini configuration file for Grafana deployed via Helm, ensuring that your changes are applied to the Grafana instance in your Kubernetes cluster.


