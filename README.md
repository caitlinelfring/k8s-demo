k8s-demo
---

# Requirements
- [Docker Desktop on Mac](https://docs.docker.com/docker-for-mac/install/)
- [Kubernetes cluster enabled](https://docs.docker.com/docker-for-mac/#kubernetes)

# Setup
Install helm:
```
make helm-init
```

Install nginx ingress controller:
```
make nginx
```

# Deploy
Deploy `hello-world`
```
make deploy
```

Then set the following line in `/etc/hosts`
```
127.0.0.1 hello-world.local
```

Or
```
curl -H "Host: hello-world.local" localhost
```

This will confirm you can access the application through the nginx ingress controller.

See [./Makefile]() for more tasks
