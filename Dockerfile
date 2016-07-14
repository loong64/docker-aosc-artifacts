FROM scratch
MAINTAINER AOSC-dev
ADD "https://repo.aosc.io/aosc-os/base/aosc-os_base_20160713_dpkg.tar.xz" /
RUN apt purge -y linux+kernel linux-kernel-4.6.3
CMD ["/bin/bash"]
ARG CONT_IMG_VER
ENV CONT_IMG_VER 20160713
