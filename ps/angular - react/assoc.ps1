# Ścieżki do projektu
$backendPath = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\Toci.Intotech.Xerion.API"
$frontendPath = "C:\Users\bzapa\source\repos\toci888\xerion_8.0\XerionIntegration\xerionfront\src"

# Tworzenie backendu
Write-Host "Creating backend structure..." -ForegroundColor Cyan

# Dodanie modeli
$modelPath = Join-Path $backendPath "Models"
New-Item -ItemType Directory -Force -Path $modelPath | Out-Null
Set-Content -Path (Join-Path $modelPath "User.cs") -Value @"
public class User
{
    public int Id { get; set; }
    public string Name { get; set; }
    public string Profession { get; set; }
    public string Location { get; set; }
    public List<Connection> Connections { get; set; }
}
"@

Set-Content -Path (Join-Path $modelPath "Connection.cs") -Value @"
public class Connection
{
    public int Id { get; set; }
    public int UserId { get; set; }
    public int ConnectedUserId { get; set; }
    public User User { get; set; }
    public User ConnectedUser { get; set; }
}
"@

# Tworzenie DbContext
$dbContextPath = Join-Path $backendPath "Data"
New-Item -ItemType Directory -Force -Path $dbContextPath | Out-Null
Set-Content -Path (Join-Path $dbContextPath "MainDbContext.cs") -Value @"
using Microsoft.EntityFrameworkCore;
public class MainDbContext : DbContext
{
    public DbSet<User> Users { get; set; }
    public DbSet<Connection> Connections { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseNpgsql(""Host=localhost;Database=Xerion;Username=postgres;Password=yourpassword"");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Connection>()
            .HasOne(c => c.User)
            .WithMany(u => u.Connections)
            .HasForeignKey(c => c.UserId);
    }
}
"@

# Tworzenie kontrolera API
$controllerPath = Join-Path $backendPath "Controllers"
New-Item -ItemType Directory -Force -Path $controllerPath | Out-Null
Set-Content -Path (Join-Path $controllerPath "ConnectionsController.cs") -Value @"
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Route(""api/[controller]"")]
[ApiController]
public class ConnectionsController : ControllerBase
{
    private readonly MainDbContext _context;

    public ConnectionsController(MainDbContext context)
    {
        _context = context;
    }

    [HttpGet(""search"")]
    public async Task<IActionResult> SearchSimilarProfession(string profession, string location)
    {
        var users = await _context.Users
            .Where(u => u.Profession == profession && u.Location == location)
            .ToListAsync();
        return Ok(users);
    }

    [HttpPost]
    public async Task<IActionResult> AddConnection(int userId, int connectedUserId)
    {
        var connection = new Connection { UserId = userId, ConnectedUserId = connectedUserId };
        _context.Connections.Add(connection);
        await _context.SaveChangesAsync();
        return Ok(connection);
    }
}
"@

# Tworzenie frontend React
Write-Host "Creating frontend React structure..." -ForegroundColor Cyan
$frontendComponents = Join-Path $frontendPath "src\components"
New-Item -ItemType Directory -Force -Path $frontendComponents | Out-Null
Set-Content -Path (Join-Path $frontendComponents "Connections.tsx") -Value @"
import React, { useState } from 'react';
import axios from 'axios';

const Connections: React.FC = () => {
    const [profession, setProfession] = useState('');
    const [location, setLocation] = useState('');
    const [users, setUsers] = useState([]);

    const searchUsers = async () => {
        const response = await axios.get(`/api/Connections/search`, {
            params: { profession, location },
        });
        setUsers(response.data);
    };

    const addConnection = async (userId: number) => {
        await axios.post(`/api/Connections`, {
            userId,
            connectedUserId: 1, // Example current user ID
        });
        alert('Connection added!');
    };

    return (
        <div>
            <h1>Find Professionals</h1>
            <input
                type=""text""
                placeholder=""Profession""
                value={profession}
                onChange={(e) => setProfession(e.target.value)}
            />
            <input
                type=""text""
                placeholder=""Location""
                value={location}
                onChange={(e) => setLocation(e.target.value)}
            />
            <button onClick={searchUsers}>Search</button>

            <ul>
                {users.map((user: any) => (
                    <li key={user.id}>
                        {user.name} ({user.profession})
                        <button onClick={() => addConnection(user.id)}>Add Connection</button>
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default Connections;
"@

Write-Host "Full flow completed!" -ForegroundColor Green
