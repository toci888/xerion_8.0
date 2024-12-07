using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Toci.Intotech.Xerion.API.Data;
using Toci.Intotech.Xerion.API.Models;
using Toci.Intotech.Xerion.API.DTOs;

namespace Toci.Intotech.Xerion.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class JobSeekersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public JobSeekersController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetJobSeekers()
        {
            return Ok(await _context.JobSeekers.ToListAsync());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetJobSeeker(int id)
        {
            var jobSeeker = await _context.JobSeekers.FindAsync(id);
            if (jobSeeker == null) return NotFound();
            return Ok(jobSeeker);
        }

        [HttpPost]
        public async Task<IActionResult> CreateJobSeeker(JobSeekerDTO dto)
        {
            var jobSeeker = new JobSeeker
            {
                FullName = dto.FullName,
                Email = dto.Email,
                Skills = dto.Skills,
                Region = dto.Region
            };
            _context.JobSeekers.Add(jobSeeker);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetJobSeeker), new { id = jobSeeker.Id }, jobSeeker);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateJobSeeker(int id, JobSeekerDTO dto)
        {
            var jobSeeker = await _context.JobSeekers.FindAsync(id);
            if (jobSeeker == null) return NotFound();

            jobSeeker.FullName = dto.FullName;
            jobSeeker.Email = dto.Email;
            jobSeeker.Skills = dto.Skills;
            jobSeeker.Region = dto.Region;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteJobSeeker(int id)
        {
            var jobSeeker = await _context.JobSeekers.FindAsync(id);
            if (jobSeeker == null) return NotFound();

            _context.JobSeekers.Remove(jobSeeker);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
