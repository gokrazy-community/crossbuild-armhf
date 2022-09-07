# Cross-compilation docker container for armhf (Raspberry Pi 32 bits)

This repository hosts a docker container for cross-compiling the 32 bits Linux bits kernel image for the Raspberry Pi.

```
docker run --rm \
    -v /path/to/the/kernel:/root/armhr \
    ghcr.io/gokrazy-community/crossbuild-armhf:jammy-20220815 \
    make zImage
```
