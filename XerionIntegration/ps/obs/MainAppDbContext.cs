using Microsoft.EntityFrameworkCore;
using Xerion.Backend.Models;

namespace Xerion.Backend.Persistence
{
    public class MainAppDbContext : DbContext
    {
        public MainAppDbContext(DbContextOptions<MainAppDbContext> options)
            : base(options)
        {
        }

        // DbSet for each table
        public DbSet<EmailsRegister> EmailsRegisters { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<AccountSocialMediaLink> AccountSocialMediaLinks { get; set; }
        public DbSet<AccountTechnicalSkill> AccountTechnicalSkills { get; set; }
        public DbSet<AccountTag> AccountTags { get; set; }
        public DbSet<AccountSoftSkillsTitle> AccountSoftSkillsTitles { get; set; }
        public DbSet<AccountSoftSkill> AccountSoftSkills { get; set; }
        public DbSet<AccountCourseCertificate> AccountCoursesCertificates { get; set; }
        public DbSet<AccountEducation> AccountEducations { get; set; }
        public DbSet<AccountForeignLanguage> AccountForeignLanguages { get; set; }
        public DbSet<AccountWorkExperience> AccountWorkExperiences { get; set; }
        public DbSet<AccountWorkResponsibility> AccountWorkResponsibilities { get; set; }
        public DbSet<UserExtraData> UserExtraDatas { get; set; }
        public DbSet<FailedLoginAttempt> FailedLoginAttempts { get; set; }
        public DbSet<ResetPassword> ResetPasswords { get; set; }
        public DbSet<PushToken> PushTokens { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            // Fluent API configurations
            modelBuilder.Entity<EmailsRegister>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Email).IsRequired();
                entity.Property(e => e.IsVerified).HasDefaultValue(false);
                entity.Property(e => e.CreatedAt).HasDefaultValueSql("now()");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Name).IsRequired(false);
            });

            modelBuilder.Entity<Account>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Email).IsRequired().HasMaxLength(255);
                entity.HasIndex(e => e.Email).IsUnique();
                entity.Property(e => e.Password).IsRequired();
                entity.Property(e => e.CreatedAt).HasDefaultValueSql("now()");
                entity.HasOne(e => e.Role)
                    .WithMany()
                    .HasForeignKey(e => e.IdRole)
                    .OnDelete(DeleteBehavior.Restrict);
            });

            modelBuilder.Entity<AccountSocialMediaLink>(entity =>
            {
                entity.HasKey(e => e.Id);
                entity.Property(e => e.Name).IsRequired();
                entity.Property(e => e.Link).IsRequired();
                entity.HasOne(e => e.Account)
                    .WithMany()
                    .HasForeignKey(e => e.IdAccount)
                    .OnDelete(DeleteBehavior.Cascade);
            });

            // Add similar configurations for other entities
        }
    }
}
