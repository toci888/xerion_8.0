# Ustaw ścieżki do projektów Angular i React
$angularSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\Client\src"
$reactSrc = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"

# Upewnij się, że ścieżka React istnieje
if (-Not (Test-Path $reactSrc)) {
    Write-Host "React project directory does not exist!" -ForegroundColor Red
    exit
}

# Tworzenie struktur katalogów w projekcie React
$folders = @("components", "pages", "services", "routes")
foreach ($folder in $folders) {
    $folderPath = Join-Path $reactSrc $folder
    if (-Not (Test-Path $folderPath)) {
        New-Item -ItemType Directory -Force -Path $folderPath | Out-Null
    }
}

# Transpilacja komponentów Angular na React
$angularComponents = Get-ChildItem -Path "$angularSrc\app\components" -Filter "*.component.ts" -Recurse
foreach ($component in $angularComponents) {
    $componentName = [IO.Path]::GetFileNameWithoutExtension($component.Name).Replace(".component", "")
    $reactFileName = Join-Path "$reactSrc\pages" "$componentName.tsx"

    Write-Host "Transpiling Angular component: $componentName" -ForegroundColor Green

    # Przykładowa transpilacja Angular -> React
    $angularCode = Get-Content -Path $component.FullName
    $reactCode = @"
import React, { useState, useEffect } from 'react';

const $componentName = React.FC = () => {
    const [data, setData] = useState<any[]>([]);

    useEffect(() => {
        // Simulate component initialization
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
    Set-Content -Path $reactFileName -Value $reactCode
}

# Transpilacja serwisów Angular na React
$angularServices = Get-ChildItem -Path "$angularSrc\app\services" -Filter "*.service.ts" -Recurse
foreach ($service in $angularServices) {
    $serviceName = [IO.Path]::GetFileNameWithoutExtension($service.Name).Replace(".service", "")
    $reactFileName = Join-Path "$reactSrc\services" "$serviceName.ts"

    Write-Host "Transpiling Angular service: $serviceName" -ForegroundColor Green

    # Przykładowa transpilacja Angular service -> React
    $angularCode = Get-Content -Path $service.FullName
    $reactCode = @"
import axios from 'axios';

const baseUrl = 'https://api.example.com';

export const $serviceName = async () => {
    const response = await axios.get(\`\${baseUrl}/endpoint\`);
    return response.data;
};
"@
    Set-Content -Path $reactFileName -Value $reactCode
}

# Tworzenie React Router
Write-Host "Creating React Router configuration..." -ForegroundColor Green
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

Write-Host "Angular to React transpilation completed successfully!" -ForegroundColor Cyan
