# Introduction
Docker repository for aosc-os

# How to install image:
```
docker pull jiegec/aosc-os:#{version}
```

# How to build image from sources:
```
docker build -t jiegec/aosc-os:#{version}
https://github.com/AOSC-Dev/aosc-os-docker-files/raw/master/#{version}/Dockerfile
```

# How to make a new Dockerfile for a new version for maintainers:
```
./gen_dockerfile.rb
(enter the download url of the new version)
./gen_versions.rb
git add .
git commit -m "Add #{version}"
git push
```
