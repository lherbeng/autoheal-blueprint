# **Three Essential Probes:**

***Startup Probe***

- Is container started?
- Kubernetes will direct traffic to the pod only if startup probe pass

***Readiness Probe***

- Container ready or not?
- IF the readiness probe fails, kubernetes will stop traffic to the container until the probe passes
- Used throughout the lifetime of the container, at regular intervals

- Readiness probe is very similar to startup probe, but it is used throughput the lifetime of the container.
- It is meant to check periodically if the app is still ready to work or not.
- If it is not ready, kubernetes will stop sending requests to it until it is ready again.

Why would the app not be ready?

- it is overload
- It might need to do some housekeeping or cleanup.
- Some of its dependencies(A cache, a database, etc.) are not working or are unreachable.

***Liveness Probe***

- Whether a container is alive / healthy or not?
- If the liveness probe fails, kubernetes will restart the container
- Used throughout the lifetime of the container, at regular intervals

Designed to test the status of a container and restart the container if it is not live. You app/container may become unresponsive for various reason

- A bug in the system
- Waiting for another resource indefinitely (A deadluck which can be considered a hard to track bug).
- Becoming too overloaded.

In such situations, sometimes the best thing to do to automatically resolve the problem is to restart the process (container). That is when the probe will become handy.



Probes have a number of fields that you can use to more precisely control the behavior of startup, liveness and readiness checks: 
Please visit this official documentation about [Configure Probes](https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/#configure-probes).


# **Deployment**

**Startup Probe**

Deploy the dep-startup.yaml file.

![deploy](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/cd344b44-ba95-4459-ba7a-dc4cedc5dc5e)

Check the deployment, pods, replicasets

![pods](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/bc5add41-80b3-479e-a287-73cedba620ab)

Expose the deployment

![svc](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/fa42566b-879e-4341-b2e7-92e30f3f9031)

To test the startupProbe, try to access one of the pods and delete the index.html in /var/www/html directory.

![delete](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/d48a779a-24de-43a7-bc10-a05674f09824)

Traffic to the two pods will deliver the appropriate application, while traffic to startup-6dc5dd57d6-d6f9d will deliver the Apache Default Page as we purposefully removed the index.hmtl. However, we can still see the service endpoints of the pod and the pod is still running because the startupProbe cannot check the condition of the pods once they are up and running or if something awful has occurred to them. 

![svc1](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/d160d1f9-a765-45e6-ae09-79b523e00a24)

The solution is readinessProbe, delete the startup deployment and deploy the readiness deployment.

![delete](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/949ac623-725d-4b13-b71b-186f43371659)

If you don't have startupProbe configured and something happened whether the services are not available or the developer has created the file with the typo error, the kubernetes has no way to find out whether it is running or not.

**Readiness Probe**

Deploy the dep-readiness.yaml file.

![deploy](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/15810085-6108-4645-a21f-5605becf2033)

Check the deployment, pods, replicasets

![deploy](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/4871e4f0-f3a4-4015-b5b6-859541ea0463)

If you describe the pods, it shows that the container was successfully started.

![describe](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/3064af00-3774-4cb2-bb66-d42926576079)

Expose the deployment and describe the service

![svc](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/7f23aefc-95d0-4b41-b203-a04e53d18d93)

Now, access the pod readiness-595d7bb4f6-f2cw9 and delete the index.html file.

![delete](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/e91bc3e5-8a60-40b5-ad3f-6b9be51b4d66)

If you check the pod readiness-595d7bb4f6-f2cw9 and service readiness-svc, the status of pod is not READY and the endpoints should be removed in svc so that kubernetes will stop sending requests to it until it is ready again.

![pods](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/3068602c-8ed2-4197-8d41-37948cf902fd)

You can observe that the Readiness probe was unsuccessful if you describe the pods. The livesnessProbe comes into play here because if the pod became unhealthy, Kubernetes should take action, such as restarting it.

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/ef38e9c5-c587-4c22-8cf7-ce7587ecf5f4)

The solution is livenessProbe, delete the readiness deployment and deploy the liveness deployment.

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/848af87b-ff22-4ca0-90be-ac690046c31c)

**Liveness Probe**

Deploy the dep-liveness.yaml file.

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/b90d29be-c01f-4c63-beab-7d390f46502b)

Check the deployment, pods, replicasets

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/4a2be19c-2015-4b6e-bc70-91cfae54db73)

Expose the deployment and describe the service

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/042c081a-9a57-4bcd-a767-bea125259dc7)

Now, access the pod liveness-f55c4d866-8pkf5 and delete the index.html file.

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/2794e2a3-5a49-4554-9ba4-67fad8987072)

Now, try to watch the pods to observe the livenessProbe. As you can see the pod liveness-f55c4d866-8pkf5 was replaced and the name wasn't changed.

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/e2a04ae5-a642-40f3-940f-13f351027be4)

If you describe the pod, you will be able to see that the liveness probe failed and kubernetes restarted the container.

![image](https://github.com/lherbeng/autoheal-blueprint/assets/72662912/70a92a0b-2a7c-4921-85d4-d679ead1eb45)



