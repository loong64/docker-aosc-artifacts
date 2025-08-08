#!/bin/bash
if [[ "x${TARBALL_URL}" == "x" ]]; then
  read -r -p "[*] Enter tarball download URL: " TARBALL_URL
fi
TARBALL_NAME="$(basename "${TARBALL_URL}")"
echo "[+] Downloading tarball..."
wget -c "${TARBALL_URL}"
if ! test -e "${TARBALL_NAME}"; then
    echo "[!] File not found?!"
    exit 127
fi
IMG_VER=$(echo "${TARBALL_NAME}" | perl -nle '/^aosc-.*_(\d+)_.*$/; print $1')
if [[ "x${IMG_VER}" == 'x' && "x${UNATTENDED}" != 'x' ]]; then
  echo "[!] Unable to deduce the image version, please manually set version"
  read -r -p "[*] Enter version for this image [20180000]: " IMG_VER
else
  IMG_VER="${IMG_VER:-20190000}"
  echo "[+] Automatically set version to ${IMG_VER} ."
fi
echo -n "[+] Generating Dockerfile..."
cat << EOF > Dockerfile
FROM scratch
LABEL maintainer="AOSC-dev"
ADD "${TARBALL_NAME}" /
CMD ["/bin/bash"]
ARG CONT_IMG_VER
ENV CONT_IMG_VER=${IMG_VER}
RUN sed -i 's/*               -       nice/#*               -       nice/' /etc/security/limits.conf
EOF

echo " OK!"
echo "IMG_VER=${IMG_VER}" >> "$GITHUB_OUTPUT"
