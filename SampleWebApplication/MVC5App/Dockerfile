#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY ["MVC5App/MVC5App.csproj", "MVC5App/"]
RUN dotnet restore "MVC5App/MVC5App.csproj"
COPY . .
WORKDIR "/src/MVC5App"
RUN dotnet build "MVC5App.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MVC5App.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MVC5App.dll"]