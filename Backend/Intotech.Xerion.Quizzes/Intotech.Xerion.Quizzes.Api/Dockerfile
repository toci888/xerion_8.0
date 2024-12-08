FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Backend/Intotech.Xerion.Quizzes/Intotech.Xerion.Quizzes.Api/Intotech.Xerion.Quizzes.Api.csproj", "Backend/Intotech.Xerion.Quizzes/Intotech.Xerion.Quizzes.Api/"]
RUN dotnet restore "./Backend/Intotech.Xerion.Quizzes/Intotech.Xerion.Quizzes.Api/./Intotech.Xerion.Quizzes.Api.csproj"
COPY . .
WORKDIR "/src/Backend/Intotech.Xerion.Quizzes/Intotech.Xerion.Quizzes.Api"
RUN dotnet build "./Intotech.Xerion.Quizzes.Api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "./Intotech.Xerion.Quizzes.Api.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Intotech.Xerion.Quizzes.Api.dll"]
