using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Toci.Intotech.Xerion.API.Data;
using Toci.Intotech.Xerion.API.Models;
using Toci.Intotech.Xerion.API.DTOs;

namespace Toci.Intotech.Xerion.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PropertiesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PropertiesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetProperties()
        {
            return Ok(await _context.Properties.ToListAsync());
        }

        [HttpPost]
        public async Task<IActionResult> CreateProperty(PropertyDTO dto)
        {
            var property = new Property
            {
                Address = dto.Address,
                Region = dto.Region,
                Price = dto.Price,
                Available = dto.Available
            };
            _context.Properties.Add(property);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetProperties), new { id = property.Id }, property);
        }
    }
}
