# snis-builder

## build container
``` 
git clone https://github.com/fgerling/snis-builder.git
cd snis-builder
podman build -t $USER/snisbuilder .
```

## build snis in container
```
podman run -ti --rm --userns=keep-id -v $PWD/data:/app $USER/snisbuilder:latest
```
