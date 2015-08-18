# Introduction

Docker image configuration, tools, and documentation repository.

## Rationale

AOSC OS has been distributing in the form of tarballs for a long time. It should make sense to provide
users with Docker images that suites for specialized functions, for example, a webserver that runs on
nginx, or a base system that runs all the building necesities (yes, packagers should always keep their
workspace minimal).

Docker images are (very) simple to deploy, and does not interfere with the running system (in a container),
therefore it is sensible to run applications in such a container.

## What is provided here

We provide basic tools for creating images from existing AOSC OS releases (too big to upload to the
Docker Hub probably), and Dockerfiles for you to enjoy the DIY process.

Also, documentations are provided with information to developers about maintaining the images, and
on how to improve them.

# How to make a new Dockerfile for a new version for maintainers
```
cd scriptlets
./gen_dockerfile.rb
(enter the download url here)
cd #{version}
nano Dockerfile
(do your customization here)
(build the docker image now)
```
