# Ścieżki do projektu
$backendPath = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\Toci.Intotech.Xerion.API"
$frontendPath = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"

# Tworzenie backendu
Write-Host "Creating backend structure for Job Map..." -ForegroundColor Cyan

# Dodanie modelu Job z lokalizacją
$modelPath = Join-Path $backendPath "Models"
Set-Content -Path (Join-Path $modelPath "Job.cs") -Value @"
public class Job
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Company { get; set; }
    public double Latitude { get; set; }
    public double Longitude { get; set; }
}
"@

# Tworzenie DbContext
$dbContextPath = Join-Path $backendPath "Data"
Set-Content -Path (Join-Path $dbContextPath "MainDbContext.cs") -Value @"
using Microsoft.EntityFrameworkCore;
public class MainDbContext : DbContext
{
    public DbSet<Job> Jobs { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseNpgsql(""Host=localhost;Database=Xerion;Username=postgres;Password=yourpassword"");
    }
}
"@

# Tworzenie kontrolera API
$controllerPath = Join-Path $backendPath "Controllers"
Set-Content -Path (Join-Path $controllerPath "JobsController.cs") -Value @"
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Route(""api/[controller]"")]
[ApiController]
public class JobsController : ControllerBase
{
    private readonly MainDbContext _context;

    public JobsController(MainDbContext context)
    {
        _context = context;
    }

    [HttpGet(""map"")]
    public async Task<IActionResult> GetJobsForMap()
    {
        var jobs = await _context.Jobs.Select(job => new 
        {
            job.Id,
            job.Title,
            job.Company,
            job.Latitude,
            job.Longitude
        }).ToListAsync();

        return Ok(jobs);
    }
}
"@

# Tworzenie frontend React
Write-Host "Creating frontend React structure for Job Map..." -ForegroundColor Cyan
$frontendComponents = Join-Path $frontendPath "src\components"
New-Item -ItemType Directory -Force -Path $frontendComponents | Out-Null
Set-Content -Path (Join-Path $frontendComponents "JobMap.tsx") -Value @"
import React, { useEffect, useState } from 'react';
import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet';
import axios from 'axios';

interface Job {
    id: number;
    title: string;
    company: string;
    latitude: number;
    longitude: number;
}

const JobMap: React.FC = () => {
    const [jobs, setJobs] = useState<Job[]>([]);

    useEffect(() => {
        const fetchJobs = async () => {
            const response = await axios.get('/api/Jobs/map');
            setJobs(response.data);
        };
        fetchJobs();
    }, []);

    return (
        <MapContainer center={[52.2297, 21.0122]} zoom={10} style={{ height: '100vh', width: '100%' }}>
            <TileLayer
                url=""https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png""
                attribution=""&copy; <a href='https://www.openstreetmap.org/copyright'>OpenStreetMap</a> contributors""
            />
            {jobs.map((job) => (
                <Marker key={job.id} position={[job.latitude, job.longitude]}>
                    <Popup>
                        <strong>{job.title}</strong> <br />
                        {job.company}
                    </Popup>
                </Marker>
            ))}
        </MapContainer>
    );
};

export default JobMap;
"@

Write-Host "Full map functionality created!" -ForegroundColor Green
