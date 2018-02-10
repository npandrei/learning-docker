# alternative for build - use volumes
FROM microsoft/aspnetcore-build:latest AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY ./src/demo/*.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY ./src/demo/ ./

RUN npm install
RUN dotnet publish -c Release -o out

# use the ASP.NET Core image
FROM microsoft/aspnetcore:latest

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY --from=build-env /app/out .

# Make port 80 available to the world outside this container
EXPOSE 80

# ENV ASPNETCORE_ENVIRONMENT "Development"

# Run the app
ENTRYPOINT ["dotnet", "demo.dll"]