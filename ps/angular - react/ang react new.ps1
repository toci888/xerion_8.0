# Ścieżka projektu Angular i React
$angularSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Client\src"
$reactSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"

# Tworzenie katalogów docelowych
if (-Not (Test-Path $reactSrc)) {
    New-Item -ItemType Directory -Force -Path $reactSrc | Out-Null
}

# Funkcja do transliteracji HTML -> JSX
function Transpile-HTMLToJSX {
    param (
        [string]$inputPath,
        [string]$outputPath
    )

    # Wczytaj zawartość HTML
    $htmlContent = Get-Content -Path $inputPath

    # Zamiana atrybutów Angular na React
    $jsxContent = $htmlContent `
        -replace "ngClass", "className" `
        -replace "ngIf", "condition" `
        -replace "ngFor=\"let (.*?) of (.*?)\"", "condition={$2.map(($1) => (" `
        -replace "\[style\.(.*?)\]", "style={$1: " `
        -replace "\[attr\.(.*?)\]", "$1"

    # Zamiana Angularowego bindowania na Reacta
    $jsxContent = $jsxContent `
        -replace "\[(.*?)\]=\"(.*?)\"", "{$1={$2}}" `
        -replace "\((.*?)\)=\"(.*?)\"", "on$($1):{$2}" `
        -replace "class=\"(.*?)\"", "className=\"$1\""

    # Zapis do JSX
    Set-Content -Path $outputPath -Value $jsxContent
    Write-Host "Transliterated: $inputPath -> $outputPath" -ForegroundColor Green
}

# Rekursywne przetwarzanie HTML w Angularze na JSX w React
Get-ChildItem -Path $angularSrc -Recurse -Filter "*.html" | ForEach-Object {
    $inputPath = $_.FullName
    $relativePath = $inputPath.Substring($angularSrc.Length).TrimStart("\")
    $outputPath = Join-Path $reactSrc $relativePath.Replace(".html", ".tsx")

    # Upewnij się, że katalog docelowy istnieje
    $outputDir = Split-Path -Path $outputPath
    if (-Not (Test-Path $outputDir)) {
        New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
    }

    # Translacja HTML -> JSX
    Transpile-HTMLToJSX -inputPath $inputPath -outputPath $outputPath
}

Write-Host "Transliteration completed!" -ForegroundColor Cyan
