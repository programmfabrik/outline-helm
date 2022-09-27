# outline-helm

Deploy [outline](https://github.com/outline/outline) with helm in K8s.

## Requirements

- [Kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/)
- [helm](https://github.com/helm/helm/)
- [helm-docs](https://github.com/norwoodj/helm-docs)
- [ct](https://github.com/helm/chart-testing)
- A local Kubernetes cluster either via [Minikube](https://minikube.sigs.k8s.io/docs/start/), [Kind](https://kind.sigs.k8s.io/) or [Docker-Desktop](https://www.docker.com/products/docker-desktop/)
- *Yamllint*, *Yamale* simply install these packages with `make dep-install`

## Lint charts

```bash
make lint
```

## Test Install charts

```bash
make install
```

## Generate Documentation

```bash
make docs
```

## ATTENTION

When using the embedded minio deployment, make sure to expose minio in order to be able to upload files. If you decide to use the embedded minio deployment, but you are not exposing it to the outside world, you won't be able to upload files. Outline will still work, but you won't be able to upload files. The message that you will see is `Upload Failed!`

The Console will show the following message in addition to the one above:

```txt
Cross-Origin Request Blocked: The Same Origin Policy disallows reading the remote resource at http://outline-minio.outline.svc:9000/. (Reason: CORS request did not succeed). Status code: (null).
```
