FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 5010

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Backend/Intotech.Xerion.Api/Intotech.Xerion.Api.csproj", "Backend/Intotech.Xerion.Api/"]
RUN dotnet restore "Backend/Intotech.Xerion.Api/Intotech.Xerion.Api.csproj"
COPY . .
WORKDIR "/src/Backend/Intotech.Xerion.Api"
RUN dotnet build "Intotech.Xerion.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Intotech.Xerion.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_URLS http://*:5010
ENTRYPOINT ["dotnet", "Intotech.Xerion.Api.dll"]
