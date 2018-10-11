# docker-images
Teletraan common docker images

Now we have our private registry service now

## build step

```bash

git clone https://github.com/teletraan/docker-images.git
cd docker-images
docker build -f django-1.11 -t django:1.11 .

# tag the image
docker tag django:1.11 teletraan/django:1.11   # or other tag

# login hub.docker.com
docker login
# input password for teletraan

docker push teletraan/django:1.11

# or you can push image to our private registry server
docker login registry.teletraan.io
# input username and password

docker tag django:1.11 registry.teletraan.io/scanvis/django:1.11

docker push registry.teletraan.io/scanvis/django:1.11

# you should add a project name, "scanvis", for example, between registry server and image name

# login registry.teletraan.io with a broswer
# and mark the repository as public if necessary

# pull image

docker pull registry.teletraan.io/scanvis/django:1.11

```