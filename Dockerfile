FROM scratch
MAINTAINER AOSC-dev
ADD "https://repo.aosc.io/aosc-os/base/aosc-os_base_20160505_dpkg.tar.xz" /
RUN apt purge -y linux+kernel linux-kernel-4.4.1
CMD ["/bin/bash"]
ARG CONT_IMG_VER
ENV CONT_IMG_VER 20160505
