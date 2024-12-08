using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

[Route("api/[controller]")]
[ApiController]
public class JobsController : ControllerBase
{
    private readonly MainDbContext _context;

    public JobsController(MainDbContext context)
    {
        _context = context;
    }

    [HttpGet("map")]
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
