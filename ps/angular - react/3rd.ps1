# Ścieżki źródłowego projektu Angular i docelowego React
$angularSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Client\src"
$reactSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"

# Struktury katalogów w React
$folders = @("components", "pages", "services", "routes")
foreach ($folder in $folders) {
    $folderPath = Join-Path $reactSrc $folder
    if (-Not (Test-Path $folderPath)) {
        New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    }
}

# Funkcja do transliteracji Angular komponentów na React
function Transpile-AngularToReact {
    param (
        [string]$filePath,
        [string]$outputPath
    )

    $componentName = [IO.Path]::GetFileNameWithoutExtension($filePath).Replace(".component", "")
    $reactCode = @"
import React, { useEffect, useState } from 'react';

const $componentName = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        console.log('$componentName mounted');
    }, []);

    return (
        <div>
            <h1>$componentName Component</h1>
        </div>
    );
};

export default $componentName;
"@

    Set-Content -Path $outputPath -Value $reactCode
}

# Funkcja do transliteracji Angular serwisów na React
function Transpile-ServiceToReact {
    param (
        [string]$filePath,
        [string]$outputPath
    )

    $serviceName = [IO.Path]::GetFileNameWithoutExtension($filePath).Replace(".service", "")
    $reactServiceCode = @"
import axios from 'axios';

const baseUrl = 'https://api.example.com';

export const $serviceName = async (): Promise<any> => {
    const response = await axios.get(\`\${baseUrl}/endpoint\`);
    return response.data;
};

export default $serviceName;
"@

    Set-Content -Path $outputPath -Value $reactServiceCode
}

# Rekursywne przetwarzanie plików Angular na React
Get-ChildItem -Path $angularSrc -Recurse | ForEach-Object {
    $filePath = $_.FullName
    if ($filePath -like "*.component.ts") {
        $componentName = [IO.Path]::GetFileNameWithoutExtension($filePath).Replace(".component", "")
        $reactPath = Join-Path "$reactSrc\pages" "$componentName.tsx"
        Write-Host "Transliterating Angular component: $componentName" -ForegroundColor Green
        Transpile-AngularToReact -filePath $filePath -outputPath $reactPath
    } elseif ($filePath -like "*.service.ts") {
        $serviceName = [IO.Path]::GetFileNameWithoutExtension($filePath).Replace(".service", "")
        $reactServicePath = Join-Path "$reactSrc\services" "$serviceName.ts"
        Write-Host "Transliterating Angular service: $serviceName" -ForegroundColor Green
        Transpile-ServiceToReact -filePath $filePath -outputPath $reactServicePath
    } elseif ($filePath -like "*.html") {
        # Przetwarzanie HTML na JSX (prostą konwersję)
        $htmlContent = Get-Content -Path $filePath
        $jsxContent = $htmlContent -replace "<!--.*?-->", "" -replace "(?s)<script.*?</script>", "" # Usuń skrypty i komentarze
        $jsxPath = Join-Path "$reactSrc\components" "$([IO.Path]::GetFileNameWithoutExtension($filePath)).jsx"
        Set-Content -Path $jsxPath -Value $jsxContent
    }
}

# Tworzenie React Router
Write-Host "Creating React Router configuration..." -ForegroundColor Cyan
$routerFileName = Join-Path "$reactSrc\routes" "AppRoutes.tsx"
$routerCode = @"
import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import Example from '../pages/Example';

const AppRoutes: React.FC = () => {
    return (
        <Router>
            <Routes>
                <Route path='/example' element={<Example />} />
            </Routes>
        </Router>
    );
};

export default AppRoutes;
"@
Set-Content -Path $routerFileName -Value $routerCode

Write-Host "Angular to React transliteration completed successfully!" -ForegroundColor Cyan
