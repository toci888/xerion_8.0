using Microsoft.EntityFrameworkCore;
using Toci.Intotech.Xerion.API.Models;

namespace Toci.Intotech.Xerion.API.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<User> Users { get; set; }
        public DbSet<Company> Companies { get; set; }
        public DbSet<Property> Properties { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Configure relationships
            modelBuilder.Entity<Company>()
                .HasOne(c => c.Owner)
                .WithMany(u => u.Companies)
                .HasForeignKey(c => c.OwnerId);

            modelBuilder.Entity<Property>()
                .HasOne(p => p.Owner)
                .WithMany(u => u.Properties)
                .HasForeignKey(p => p.OwnerId);
        }
    }
}
