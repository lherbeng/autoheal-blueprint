Three Essential Probes:

Startup Probe 

- Is container started?
- Kubernetes will direct traffic to the pod only if startup probe pass
- One time execution

Readiness Probe

- Container ready or not?
- IF the readiness probe fails, kubernetes will stop traffic to the container until the probe passes
- Used throughout the lifetime of the container, at regular intervals

Liveness Probe

- Whether a container is alive / healthy or not?
- If the liveness probe fails, kubernetes will restart the container
- Used throughout the lifetime of the container, at regular intervals




Deploy the dep-startup.yaml file.

If you don't have startupProbe configured and something happened whether the services are not available or the developer has created the file with the typo error, the kubernetes has no way to find out whether it is running or not.
