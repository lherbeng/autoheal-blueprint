Set up Fluentd/Fluent Bit to forward logs to your centralized logging system. If you're using AWS, configure Fluent Bit to send logs to CloudWatch Logs. How to achieve this

To set up Fluent Bit to forward logs to AWS CloudWatch Logs, you need to configure Fluent Bit with the CloudWatch Logs output plugin. Here's a step-by-step guide on how to achieve this:

1. Install Fluent Bit:

Ensure you have Fluent Bit installed on your Kubernetes cluster. You can deploy Fluent Bit using Kubernetes resources or Helm charts. Below is an example of a Kubernetes ConfigMap and DaemonSet to deploy Fluent Bit.

apiVersion: v1
kind: ConfigMap
metadata:
  name: fluent-bit-config
  namespace: kube-system
data:
  fluent-bit.conf: |
    [SERVICE]
        Flush        1
        Log_Level    info
        Daemon       off
        Parsers_File parsers.conf

    [INPUT]
        Name             tail
        Path             /var/log/containers/*.log
        Parser           docker
        Tag              kube.*
        Mem_Buf_Limit    50MB
        Skip_Long_Lines  On
        DB               /var/log/flb_kube.db
        DB.Sync          normal

    [OUTPUT]
        Name   cloudwatch
        Match  *
        region <AWS_REGION>
        log_group_name <LOG_GROUP_NAME>
        log_stream_name <LOG_STREAM_NAME>


Replace <AWS_REGION>, <LOG_GROUP_NAME>, and <LOG_STREAM_NAME> with your AWS region and desired CloudWatch Logs log group and stream names.
This creates a DaemonSet that runs Fluent Bit on each node in your cluster, collecting container logs and forwarding them to CloudWatch Logs.

3. IAM Role for Fluent Bit:

Ensure that the nodes running Fluent Bit have the necessary IAM permissions to write to CloudWatch Logs. Attach an IAM role with the CloudWatchLogsFullAccess or a custom policy granting permissions to write logs.

4. Verify Logs in CloudWatch:

Once Fluent Bit is deployed and running, it will start forwarding logs to CloudWatch Logs. You can verify this by checking your CloudWatch Logs log group in the AWS Management Console.

5. Create CloudWatch Alarms and Metrics:

You can set up CloudWatch Alarms to monitor log streams and receive notifications for specific log patterns or anomalies.

This setup allows you to centralize and monitor logs from your Kubernetes cluster in AWS CloudWatch Logs, making it easier to troubleshoot issues and gather insights.

Remember to adjust Fluent Bit configurations according to your specific log collection and forwarding needs, and ensure that your IAM roles and policies are properly configured for security and access control.
2. Create Kubernetes Resources:

Apply the Fluent Bit ConfigMap and DaemonSet to your Kubernetes cluster:

kubectl apply -f fluent-bit-configmap.yaml
kubectl apply -f fluent-bit-ds.yaml

