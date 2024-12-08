FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 5012

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Backend/Intotech.Xerion.Dictionaries/Intotech.Xerion.Dictionaries.Api/Intotech.Xerion.Dictionaries.Api.csproj", "Backend/Intotech.Xerion.Dictionaries/Intotech.Xerion.Dictionaries.Api/"]
RUN dotnet restore "Backend/Intotech.Xerion.Dictionaries/Intotech.Xerion.Dictionaries.Api/Intotech.Xerion.Dictionaries.Api.csproj"
COPY . .
WORKDIR "/src/Backend/Intotech.Xerion.Dictionaries/Intotech.Xerion.Dictionaries.Api"
RUN dotnet build "Intotech.Xerion.Dictionaries.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Intotech.Xerion.Dictionaries.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENV ASPNETCORE_URLS http://*:5012
ENTRYPOINT ["dotnet", "Intotech.Xerion.Dictionaries.Api.dll"]
