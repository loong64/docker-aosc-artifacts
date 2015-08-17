# Introduction
Docker repository for aosc-os

# Available versions:
* cinnamon-beta2_obsidian_rpm_20150604_en-US
* cinnamon_cyanflame_dpkg_20150708_en-US
* gnome-beta2_obsidian_rpm_20150606_en-US
* gnome_cyanflame_dpkg_20150708_en-US
* kde_20150801_dpkg_amd64
* kde_20150801_rpm_amd64
* mate-beta2_obsidian_rpm_20150607_en-US
* mate_cyanflame_dpkg_20150709_en-US
* xfce-beta2_obsidian_rpm_20150604_en-US
* xfce_cyanflame_dpkg_20150709_en-US

# How to install image:
```
docker pull jiegec/aosc-os:#{version}
```

# How to build image from sources:
```
docker build -t jiegec/aosc-os:#{version}
https://github.com/AOSC-Dev/aosc-os-docker-files/raw/master/#{version}/Dockerfile
```
