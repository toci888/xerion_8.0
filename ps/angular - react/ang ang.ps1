# Ścieżka projektu Angular
$angularSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Client\src"

# Rekursywne przetwarzanie plików Angular
Get-ChildItem -Path $angularSrc -Recurse | ForEach-Object {
    $filePath = $_.FullName

    if ($filePath -like "*.component.ts") {
        # Uaktualnij komponenty do Angular 18
        $componentContent = Get-Content -Path $filePath

        # Zastąp wstrzykiwanie przez konstruktor nowym `inject()` (jeśli dotyczy)
        $componentContent = $componentContent -replace "constructor\((.*?)\)\s*{", "private $1 = inject($1);"

        # Dodaj obsługę Standalone Components
        if ($componentContent -notmatch "@Component\(\{.*standalone: true.*\}\)") {
            $componentContent = $componentContent -replace "@Component\(\{", "@Component({ standalone: true, "
        }

        # Zapisz zmieniony plik
        Set-Content -Path $filePath -Value $componentContent
        Write-Host "Updated Angular component: $filePath" -ForegroundColor Green

    } elseif ($filePath -like "*.service.ts") {
        # Aktualizacja serwisów do Angular 18 (jeśli są zmiany w DI)
        $serviceContent = Get-Content -Path $filePath

        # Zastąp wstrzykiwanie przez konstruktor nowym `inject()` (jeśli dotyczy)
        $serviceContent = $serviceContent -replace "constructor\((.*?)\)\s*{", "private $1 = inject($1);"

        # Zapisz zmieniony plik
        Set-Content -Path $filePath -Value $serviceContent
        Write-Host "Updated Angular service: $filePath" -ForegroundColor Green
    }
}

Write-Host "Transliteration to Angular 18 completed!" -ForegroundColor Cyan
