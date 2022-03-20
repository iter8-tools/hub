# Iter8 library chart

> This chart provides reusable primitives meant for use in other Iter8 experiment charts. Experiments can be composed by using this chart as a dependency, and by including task templates available in this lib.

**Templates for Iter8 tasks:** 

- `task.http`: The `gen-load-and-collect-metrics-http` task
- `task.grpc`: The `gen-load-and-collect-metrics-grpc` task
- `task.assess`: The `assess-app-versions` task

**Templates for Kubernetes experiment resources:**

- `k.job`: Kubernetes experiment job
- `k.spec.secret`: Kubernetes secret containing experiment spec
- `k.spec.role`: Role for Kubernetes spec secret
- `k.spec.rolebinding`: Role binding for Kubernetes spec secret
- `k.result.role`: Role for Kubernetes result secret
- `k.result.rolebinding`: Role binding for Kubernetes result secret
