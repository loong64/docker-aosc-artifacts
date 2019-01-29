#!/bin/bash
read -r -p "[*] Enter tarball download URL: " TARBALL_URL
TARBALL_NAME="$(basename "${TARBALL_URL}")"
echo "[+] Downloading tarball..."
wget -c "${TARBALL_URL}"
if ! test -e "${TARBALL_NAME}"; then
    echo "[!] File not found?!"
    exit 127
fi
IMG_VER=$(echo "${TARBALL_NAME}" | perl -nle '/^aosc-.*_(\d+)_.*$/; print $1')
if [[ "x${IMG_VER}" == 'x' ]]; then
  echo "[!] Unable to deduce the image version, please manually set version"
  read -r -p "[*] Enter version for this image [20180000]: " IMG_VER
else
  echo "[+] Automatically set version to ${IMG_VER} ."
fi
echo -n "[+] Generating Dockerfile..."
cat << EOF > Dockerfile
FROM scratch
MAINTAINER AOSC-dev
ADD "${TARBALL_NAME}" /
CMD ["/bin/bash"]
ARG CONT_IMG_VER
ENV CONT_IMG_VER ${IMG_VER}
EOF

echo " OK!"
read -n 1 -r -p "[*] Build this image [Y/n]? " BUILD_CHOICE
echo " "
if [[ "x${BUILD_CHOICE}" == "xn" ]]; then
  echo "[+] Aborted."
  exit 0
fi
TMPDIR="$(mktemp -d -p .)"
cd -- "${TMPDIR}" || (echo "[!] WTF?" && exit 127)
echo "[+] Copying files..."
mv ../Dockerfile .
cp "../${TARBALL_NAME}" .
sudo docker build .
cd ..
echo "[+] Cleaning up..."
rm -rf "${TMPDIR}"
