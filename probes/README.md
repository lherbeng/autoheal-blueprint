Three Essential Probes:

**Startup Probe**

- Is container started?
- Kubernetes will direct traffic to the pod only if startup probe pass
- One time execution

**Readiness Probe**

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

**Liveness Probe**

- Whether a container is alive / healthy or not?
- If the liveness probe fails, kubernetes will restart the container
- Used throughout the lifetime of the container, at regular intervals




Deploy the dep-startup.yaml file.

If you don't have startupProbe configured and something happened whether the services are not available or the developer has created the file with the typo error, the kubernetes has no way to find out whether it is running or not.
