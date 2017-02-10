#!/bin/bash
read -r -p "[*] Enter tarball download URL: " TARBALL_URL
TARBALL_NAME="$(basename ${TARBALL_URL})"
echo "[+] Downloading tarball..."
wget "${TARBALL_URL}"
if test -e "${TARBALL_NAME}"; then
    echo "[!] File not found?!"
    exit 127
fi
echo -n "[+] Generating Dockerfile..."
cat << EOF > Dockerfile
FROM scratch
MAINTAINER AOSC-dev
ADD "${TARBALL_NAME}" /
CMD ["/bin/bash"]
ARG CONT_IMG_VER
# ENV CONT_IMG_VER 20170000
EOF

echo " OK!"
read -n 1 -r -p "[*] Build this image [Y/N]? " BUILD_CHOICE
if [[ "${BUILD_CHOICE}" -eq "N" ]]; then
  echo "[+] Aborted."
  exit 0
fi
TMPDIR="$(mktemp -d -p .)"
cd -- "${TMPDIR}" || echo "[!] WTF?" && exit 127
ln -s ../Dockerfile .
ln -s "../${TARBALL_NAME}" .
sudo docker build .
