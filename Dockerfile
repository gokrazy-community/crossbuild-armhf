# glibc 2.34 is required for linux 5.15.30 (available since ubuntu:impish or debian:bookworm)
FROM ubuntu:jammy-20220815

# according to https://www.raspberrypi.com/documentation/computers/linux_kernel.html#cross-compiling-the-kernel
RUN apt-get update && \
    apt-get install -y  git bc bison flex libssl-dev make libc6-dev libncurses5-dev \
                        crossbuild-essential-armhf kmod


ENV KERNEL kernel
ENV ARCH arm
ENV CROSS_COMPILE arm-linux-gnueabihf-

WORKDIR /root/armhf

# Left to the user:
# 1. retrieve kernel files (from https://github.com/raspberrypi/linux for instance)
# 2. run this image, mounting the kernel folder (-v HOST_PATH:/root/armhf)
# 3. generate the config inside the container (make bcmrpi_defconfig) and adjust it if needed (CONFIG_SQUASHFS=y)
# 4. compile the kernel inside the container (make zImage modules dtbs -j12)
# 5. use the artifacts (arch/arm/zImage and arch/arm/boot/dts/bcm*-rpi-*.dt)

CMD ["/bin/bash"]
