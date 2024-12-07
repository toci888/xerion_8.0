using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Toci.Intotech.Xerion.API.Data;
using Toci.Intotech.Xerion.API.Models;
using Toci.Intotech.Xerion.API.DTOs;

namespace Toci.Intotech.Xerion.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ConnectionsController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ConnectionsController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetConnections()
        {
            return Ok(await _context.Connections.ToListAsync());
        }

        [HttpPost]
        public async Task<IActionResult> CreateConnection(ConnectionDTO dto)
        {
            var connection = new Connection
            {
                JobSeeker1Id = dto.JobSeeker1Id,
                JobSeeker2Id = dto.JobSeeker2Id,
                Approved = false
            };
            _context.Connections.Add(connection);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetConnections), new { id = connection.Id }, connection);
        }
    }
}
