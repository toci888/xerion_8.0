# PowerShell Script: Generate TypeScript Services with Full CRUD for Additional Controllers

# Define project directory for services
$servicesDir = "C:\Users\bzapa\source\repos\toci888\XerionFrontend\src\services"

# Ensure the directory exists
if (-Not (Test-Path $servicesDir)) {
    New-Item -ItemType Directory -Force -Path $servicesDir
}

# Define controllers and endpoints
$controllers = @(
    @{ Name = "Users"; Endpoint = "/api/users" },
    @{ Name = "Companies"; Endpoint = "/api/companies" },
    @{ Name = "Properties"; Endpoint = "/api/properties" },
    @{ Name = "Connections"; Endpoint = "/api/connections" },
    @{ Name = "JobOffers"; Endpoint = "/api/joboffers" },
    @{ Name = "JobSeekers"; Endpoint = "/api/jobseekers" }
)

# Iterate through controllers to generate service files
foreach ($controller in $controllers) {
    $serviceName = $controller.Name + "Service.ts"
    $filePath = Join-Path $servicesDir $serviceName
    $endpoint = $controller.Endpoint

    # Generate the TypeScript service file content
    $serviceContent = @"
import axios from 'axios';

const apiClient = axios.create({
  baseURL: 'https://your-api-url.com',
  headers: {
    'Content-Type': 'application/json',
  },
});

export const getAll$($controller.Name) = async () => {
  const response = await apiClient.get('$endpoint');
  return response.data;
};

export const get$($controller.Name)ById = async (id: number) => {
  const response = await apiClient.get(`$endpoint/\${id}`);
  return response.data;
};

export const create$($controller.Name) = async (data: any) => {
  const response = await apiClient.post('$endpoint', data);
  return response.data;
};

export const update$($controller.Name) = async (id: number, data: any) => {
  const response = await apiClient.put(`$endpoint/\${id}`, data);
  return response.data;
};

export const delete$($controller.Name) = async (id: number) => {
  const response = await apiClient.delete(`$endpoint/\${id}`);
  return response.data;
};
"@

    # Write the content to the file
    Set-Content -Path $filePath -Value $serviceContent

    # Output success message
    Write-Host "Service file created: $filePath" -ForegroundColor Green
}

# Output final success message
Write-Host "All service files generated successfully in $servicesDir." -ForegroundColor Cyan
