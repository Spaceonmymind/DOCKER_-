FROM mcr.microsoft.com/dotnet/aspnet:6.0-jammy AS base
WORKDIR /work
#EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:6.0-jammy AS build
WORKDIR /apps
COPY . /apps
RUN dotnet restore WebApplication_DIT_Docker/WebApplication_DIT_Docker.csproj \
    && dotnet build WebApplication_DIT_Docker.sln -c Release -o /app/build
WORKDIR /app/build/
ENV ASPNETCORE_URLS="http://0.0.0.0:5000"
ENTRYPOINT ["dotnet", "WebApplication_DIT_Docker.dll"]
