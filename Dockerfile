FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS build
WORKDIR /app

COPY SampleWebApplication .
RUN powershell nuget restore; dotnet build -c Release -o /out

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS runtime
WORKDIR /app
COPY --from=build /out /inetpub/wwwroot
