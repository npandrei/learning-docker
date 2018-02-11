# learning-docker

This will print the currently installed docker version

`docker version`

This will run a demo with the `hello-world` container

`docker run hello-world`

This will show all images

`docker image ls`

This will show the running containers. `-a` will show all containers

`docker container`

This will remove a container, where {id} is the id of a container shown by `docker container ls`

`docker container rm {id}`

`docker container rm $(docker container ls -a -q)` to remove all containers

This will remove an image

`docker image rm {id}`

`docker image rm $(docker image ls -a -q)` to remove all images

# docker hub

You can find images on the docker hub

`https://hub.docker.com`

We can install the ASP.NET Core image (`https://hub.docker.com/r/microsoft/aspnetcore/`) using:

`docker pull microsoft/aspnetcore`

You can also upload your images, you just have to create an account for `https://cloud.docker.com` and the login in the terminal

`docker login {username}`

After that, you need to tag your previously create image and upload it

`docker tag demo npandrei/demo:v1`

You can see the list of tagged images

`docker image ls`

You can push the image with

`docker push npandrei/demo:v1`

# ASP.NET Core

Install the latest ASP.NET Core (`https://www.microsoft.com/net/learn/get-started/`) and create a new app.

`dotnet new reactredux --name demo`

`cd src/demo`

`npm install`

`dotnet restore`

`dotnet build`

# Dockerfile

Next, create the Dockerfile & .dockerignore. It will be used to run the application.

You can build the docker image using

`docker build -t demo .`

You can run the new image with (`-d` runs the app in background)

`docker run -d -p 8000:80 demo`

# docker-compose.yml

You can use this file to configure the number of instances of a container that run in production. In order to run, we need to configure the swarm (Docker cluster)

`docker swarm init`

`docker stack deploy -c docker-compose.yml getstartedlab`

You can get the running services

`docker service ls`

`docker service ps getstartedlab_web`

`docker container ls -q`

You can stop and remove the services using 

`docker stack rm getstartedlab`

`docker swarm leave --force`

# Swarm

A swarm is cluster where the containers run. 

You can create some VMs using VirtualBox (needs to be installed)

`docker-machine create --driver virtualbox myvm1`

`docker-machine create --driver virtualbox myvm2`

You can see the VMs using

`docker-machine ls`

You can enable the swarm using

`docker-machine ssh myvm1 "docker swarm init --advertise-addr {myvm1 ip address}"`

This will output a line similar to this. You can use it to configure other nodes to join the swarm

`docker-machine ssh myvm2 "docker swarm join --token {token} {ip}:2377"`

You can show this token using

`docker-machine ssh myvm1 "docker swarm join-token worker"`

You can make the worker leave the swarm

`docker-machine ssh myvm2 "docker swarm leave"`

You can see the nodes using

`docker-machine ssh myvm1 "docker node ls"`

Instead of using `docker-machine ssh ...`, you ca configure the shell to use a certain node

`docker-machine env {machine}`

And this will output the following line, which needs to be executed to complete the process

`eval $(docker-machine env myvm1)`

You can unset this env variables using

`eval $(docker-machine env -u)`

You can start/stop the VMs using

`docker-machine stop $(docker-machine ls -q)`

And you can remove all VMs using

`docker-machine rm $(docker-machine ls -q)`

You can now deploy the app (must be in the directory where docker-compose.yml file is located)

`docker stack deploy -c docker-compose.yml getstartedlab`

And you can view how the instances are distributed

`docker stack ps getstartedlab`