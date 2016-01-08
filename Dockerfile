FROM scratch
MAINTAINER AOSC-dev
ADD "https://repo.aosc.io/aosc-os/base/aosc-os_base_20151230_dpkg.tar.xz" 
CMD ["/bin/bash"] 
ARG CONT_IMG_VER
ENV CONT_IMG_VER 20151230
