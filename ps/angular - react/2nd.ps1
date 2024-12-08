# Ścieżka do katalogu źródłowego Angular
$sourceDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Client\src"

# Ścieżka do katalogu docelowego React
$targetDir = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"

# Upewnij się, że katalog docelowy istnieje
if (-Not (Test-Path $targetDir)) {
    New-Item -ItemType Directory -Force -Path $targetDir
}

# Rekursywne przechodzenie przez pliki i przetwarzanie
Get-ChildItem -Path $sourceDir -Recurse | ForEach-Object {
    $filePath = $_.FullName
    $relativePath = $filePath.Substring($sourceDir.Length)
    $targetPath = Join-Path $targetDir $relativePath

    if ($_.PSIsContainer) {
        # Jeśli to katalog, utwórz go w React
        if (-Not (Test-Path $targetPath)) {
            New-Item -ItemType Directory -Force -Path $targetPath
        }
    } else {
        # Jeśli to plik .component.ts lub .service.ts, konwertuj
        if ($filePath -like "*.component.ts") {
            $componentName = [IO.Path]::GetFileNameWithoutExtension($_.Name).Replace(".component", "")
            $reactFilePath = "$targetDir\pages\$componentName.tsx"

            # Prosta konwersja Angular -> React
            $angularCode = Get-Content -Path $filePath
            $reactCode = @"
import React from 'react';

const $componentName = React.FC = () => {
    return (
        <div>
            <h1>$componentName Component</h1>
        </div>
    );
};

export default $componentName;
"@
            Set-Content -Path $reactFilePath -Value $reactCode
        } elseif ($filePath -like "*.service.ts") {
            $serviceName = [IO.Path]::GetFileNameWithoutExtension($_.Name).Replace(".service", "")
            $reactServicePath = "$targetDir\services\$serviceName.ts"

            # Prosta konwersja serwisu Angular -> React
            $angularCode = Get-Content -Path $filePath
            $reactCode = @"
import axios from 'axios';

const $serviceName = async () => {
    const response = await axios.get('https://api.example.com');
    return response.data;
};

export default $serviceName;
"@
            Set-Content -Path $reactServicePath -Value $reactCode
        } else {
            # Kopiowanie innych plików
            Copy-Item -Path $filePath -Destination $targetPath -Force
        }
    }
}