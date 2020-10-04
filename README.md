# snis-builder

## build container
``` 
podman run -ti --rm --userns=keep-id  -v $PWD/data:/app $USER/snisbuilder:latest
```

## build snis in container
```
podman run -ti --rm --userns=keep-id -v $PWD/data:/app $USER/snisbuilder:latest
```
