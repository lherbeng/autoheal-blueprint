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

Check the deployment, pods, replicaset

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





