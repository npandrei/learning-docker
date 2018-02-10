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

# docker hub

You can find images on the docker hub

`https://hub.docker.com`

We can install the ASP.NET Core image (`https://hub.docker.com/r/microsoft/aspnetcore/`) using:

`docker pull microsoft/aspnetcore`

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

You can run the new image with

`docker run -d -p 8000:80 demo`