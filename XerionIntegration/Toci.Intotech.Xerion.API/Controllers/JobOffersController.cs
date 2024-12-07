using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Toci.Intotech.Xerion.API.Data;
using Toci.Intotech.Xerion.API.Models;
using Toci.Intotech.Xerion.API.DTOs;

namespace Toci.Intotech.Xerion.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class JobOffersController : ControllerBase
    {
        private readonly AppDbContext _context;

        public JobOffersController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> GetJobOffers()
        {
            return Ok(await _context.JobOffers.ToListAsync());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetJobOffer(int id)
        {
            var jobOffer = await _context.JobOffers.FindAsync(id);
            if (jobOffer == null) return NotFound();
            return Ok(jobOffer);
        }

        [HttpPost]
        public async Task<IActionResult> CreateJobOffer(JobOfferDTO dto)
        {
            var jobOffer = new JobOffer
            {
                Title = dto.Title,
                Description = dto.Description,
                Salary = dto.Salary,
                Region = dto.Region
            };
            _context.JobOffers.Add(jobOffer);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetJobOffer), new { id = jobOffer.Id }, jobOffer);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateJobOffer(int id, JobOfferDTO dto)
        {
            var jobOffer = await _context.JobOffers.FindAsync(id);
            if (jobOffer == null) return NotFound();

            jobOffer.Title = dto.Title;
            jobOffer.Description = dto.Description;
            jobOffer.Salary = dto.Salary;
            jobOffer.Region = dto.Region;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteJobOffer(int id)
        {
            var jobOffer = await _context.JobOffers.FindAsync(id);
            if (jobOffer == null) return NotFound();

            _context.JobOffers.Remove(jobOffer);
            await _context.SaveChangesAsync();
            return NoContent();
        }
    }
}
