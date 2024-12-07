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
            var jobOffers = await _context.JobOffers.ToListAsync();
            return Ok(jobOffers);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetJobOffer(int id)
        {
            var jobOffer = await _context.JobOffers.FindAsync(id);
            if (jobOffer == null) return NotFound();
            return Ok(jobOffer);
        }

        [HttpPost]
        public async Task<IActionResult> CreateJobOffer(JobOfferDTO jobOfferDto)
        {
            var jobOffer = new JobOffer
            {
                Title = jobOfferDto.Title,
                Description = jobOfferDto.Description,
                Salary = jobOfferDto.Salary,
                PostedDate = DateTime.UtcNow
            };
            _context.JobOffers.Add(jobOffer);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetJobOffer), new { id = jobOffer.Id }, jobOffer);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateJobOffer(int id, JobOfferDTO jobOfferDto)
        {
            var jobOffer = await _context.JobOffers.FindAsync(id);
            if (jobOffer == null) return NotFound();

            jobOffer.Title = jobOfferDto.Title;
            jobOffer.Description = jobOfferDto.Description;
            jobOffer.Salary = jobOfferDto.Salary;
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
