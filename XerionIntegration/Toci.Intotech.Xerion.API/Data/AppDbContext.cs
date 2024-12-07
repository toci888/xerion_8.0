using Microsoft.EntityFrameworkCore;
using Toci.Intotech.Xerion.API.Models;

namespace Toci.Intotech.Xerion.API.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<JobSeeker> JobSeekers { get; set; }
        public DbSet<JobOffer> JobOffers { get; set; }
        public DbSet<Connection> Connections { get; set; }
        public DbSet<Property> Properties { get; set; }
    }
}
