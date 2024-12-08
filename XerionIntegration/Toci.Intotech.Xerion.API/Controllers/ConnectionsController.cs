using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Route("api/[controller]")]
[ApiController]
public class ConnectionsController : ControllerBase
{
    private readonly MainDbContext _context;

    public ConnectionsController(MainDbContext context)
    {
        _context = context;
    }

    [HttpGet("search")]
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
