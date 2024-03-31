FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS build
WORKDIR /wapp
COPY net/ /wapp/
RUN dotnet build WebApplication_DIT_Docker.sln

FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy
EXPOSE 80
WORKDIR /doc
COPY --from=build /wapp/WebApplication_DIT_Docker/bin/Debug/net:6.0/*.dll /doc/
COPY --from=build /wapp/WebApplication_DIT_Docker/bin/Debug/net:6.0/*.json /doc/
ENTRYPOINT ["dotnet", "WebApplication_DIT_Docker.dll"]
