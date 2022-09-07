# Cross-compilation docker image for armhf (Raspberry Pi kernel)

This repository hosts a docker image for cross-compiling the Linux kernel image for the Raspberry Pi.

```
docker run --rm \
    -v /path/to/the/kernel:/root/armhf \
    ghcr.io/gokrazy-community/crossbuild-armhf:jammy-20220815 \
    make zImage
```

This image is used by https://github.com/gokrazy-community/kernel-rpi-os-32.

---

Unfortunately it is unsuitable to cross-compile go programs, since
> By default, newer GCC versions do not create correct binaries for ARMv6. Even though you pass the correct -mcpu= flag to gcc, it will create startup code for the newer ARMv7 architecture. Running them on your RasPI Zero will cause an "Illegal Instruction" exception.

Have a look at https://github.com/Pro/raspi-toolchain for such usecases.