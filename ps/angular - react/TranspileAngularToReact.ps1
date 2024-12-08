# Ścieżki źródłowego projektu Angular i docelowego React
$angularSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Client\src"
$reactSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"


# Tworzenie katalogów w projekcie React
if (-Not (Test-Path $reactSrc)) {
    New-Item -ItemType Directory -Force -Path $reactSrc | Out-Null
}

# Funkcja: Mapowanie Angular HTML -> React JSX
function Transpile-AngularHTMLToJSX {
    param (
        [string]$inputPath,
        [string]$outputPath
    )

    # Wczytaj zawartość HTML
    $htmlContent = Get-Content -Path $inputPath -Raw

    # Mapowanie Angular HTML -> JSX
    $jsxContent = $htmlContent `
        -replace '\*ngIf="([^"]+)"', '{ $1 && (' `  # *ngIf
        -replace '\*ngFor="let ([^ ]+) of ([^"]+)"', '{ $2.map(($1) => (' `  # *ngFor
        -replace 'class="([^"]+)"', 'className="$1"' `  # class
        -replace '\[([^]]+)\]="([^"]+)"', '$1={$2}' `  # [attr]
        -replace '\(([^)]+)\)="([^"]+)"', 'on$1={$2}' `  # (event)
        -replace '\{\{([^}]+)\}\}', '{$1}' `  # {{value}}
        -replace '\[routerLink\]=\"([^"]+)\"', 'onClick={() => window.location.href=`"$1`"}' `  # [routerLink]
        -replace '\[style\.([^]]+)\]="([^"]+)"', 'style={{ $1: `$2` }}'  # [style]

    # Zamknij map() dla *ngFor
    $jsxContent += " )) }"

    # Zapis do pliku JSX
    Set-Content -Path $outputPath -Value $jsxContent
    Write-Host "Converted: $inputPath -> $outputPath" -ForegroundColor Green
}

# Rekursywne przetwarzanie HTML w Angularze
Get-ChildItem -Path $angularSrc -Recurse -Filter "*.component.html" | ForEach-Object {
    $inputPath = $_.FullName
    $relativePath = $inputPath.Substring($angularSrc.Length).TrimStart("\")
    $outputPath = Join-Path $reactSrc $relativePath.Replace(".component.html", ".tsx")

    # Upewnij się, że katalog docelowy istnieje
    $outputDir = Split-Path -Path $outputPath
    if (-Not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
    }

    # Translacja HTML -> JSX
    Transpile-AngularHTMLToJSX -inputPath $inputPath -outputPath $outputPath
}

Write-Host "Transliteration completed!" -ForegroundColor Cyan
