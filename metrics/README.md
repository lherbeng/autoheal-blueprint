# ***Creating Alerts in Grafana***

***When you install Grafana using Helm, the Helm chart deploys Grafana along with its default configuration. To edit the grafana.ini configuration file for Grafana deployed via Helm, you should follow these steps:***

1. Locate the Helm Chart Values: Find the Helm chart values file (often named values.yaml) that you used when you installed Grafana. This file contains configuration options that can be customized, including settings for Grafana.

2. Edit the Helm Chart Values: Open the values.yaml file in a text editor or code editor. Look for the section related to Grafana configuration. It might be under a key like grafana or grafanaConfig. If you can't find a specific section for Grafana configuration, check the chart's documentation for the exact key or how to customize Grafana settings.

3. Modify Grafana Configuration Settings: In the values.yaml file, you can specify the settings you want to modify in the grafana.ini file. Customize the settings according to your requirements. For example:
