

# Ustaw ścieżkę do katalogu projektu backendowego
$backendDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\Toci.Intotech.Xerion.Database.Persistence"

# Przejdź do katalogu projektu backendowego
Set-Location -Path $backendDir

# Instalacja narzędzi EF Core i dostawcy PostgreSQL
Write-Host "Instalacja zależności EF Core i PostgreSQL..." -ForegroundColor Green
dotnet tool install --global dotnet-ef
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL
dotnet add package Microsoft.EntityFrameworkCore.Design
dotnet add package Microsoft.EntityFrameworkCore.Tools

# Definiowanie łańcucha połączenia do bazy danych PostgreSQL
$dbConnectionString = "Host=your_host;Database=your_database;Username=your_user;Password=your_password"

# Generowanie modeli i kontekstu bazy danych
Write-Host "Generowanie modeli i kontekstu bazy danych dla PostgreSQL..." -ForegroundColor Green
dotnet ef dbcontext scaffold `
    $dbConnectionString `
    Npgsql.EntityFrameworkCore.PostgreSQL `
    --output-dir Models `
    --context ApplicationDbContext `
    --force

# Wyświetlenie komunikatu o sukcesie
Write-Host "Modele Code First i ApplicationDbContext dla PostgreSQL zostały pomyślnie wygenerowane." -ForegroundColor Cyan
