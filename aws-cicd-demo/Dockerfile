# See https://aka.ms/containerfastmode to learn more
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER app
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src

# ------ FIXED PATHS BELOW ---------
COPY ["aws-cicd-demo.csproj", "./"]
RUN dotnet restore "./aws-cicd-demo.csproj"

COPY . .
WORKDIR "/src"
RUN dotnet build "./aws-cicd-demo.csproj" -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./aws-cicd-demo.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "aws-cicd-demo.dll"]
