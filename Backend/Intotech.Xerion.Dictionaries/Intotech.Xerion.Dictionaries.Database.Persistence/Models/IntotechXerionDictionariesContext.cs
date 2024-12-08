using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Dictionaries.Database.Persistence.Models;

public partial class IntotechXerionDictionariesContext : DbContext
{
    public IntotechXerionDictionariesContext()
    {
    }

    public IntotechXerionDictionariesContext(DbContextOptions<IntotechXerionDictionariesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Certificate> Certificates { get; set; }

    public virtual DbSet<City> Cities { get; set; }

    public virtual DbSet<Country> Countries { get; set; }

    public virtual DbSet<Employmenttype> Employmenttypes { get; set; }

    public virtual DbSet<Environment> Environments { get; set; }

    public virtual DbSet<Foreignlanguage> Foreignlanguages { get; set; }

    public virtual DbSet<Framework> Frameworks { get; set; }

    public virtual DbSet<Hobby> Hobbies { get; set; }

    public virtual DbSet<Profession> Professions { get; set; }

    public virtual DbSet<Programminglanguage> Programminglanguages { get; set; }

    public virtual DbSet<Programminglanguagecategory> Programminglanguagecategories { get; set; }

    public virtual DbSet<Programmingtool> Programmingtools { get; set; }

    public virtual DbSet<Skillsdomain> Skillsdomains { get; set; }

    public virtual DbSet<Softskill> Softskills { get; set; }

    public virtual DbSet<Tag> Tags { get; set; }

    public virtual DbSet<Workschedule> Workschedules { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Database=Intotech.Xerion.Dictionaries;Username=postgres;Password=beatka");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Certificate>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("certificates_pkey");

            entity.ToTable("certificates");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Expirationdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("expirationdate");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Obtainingdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("obtainingdate");
            entity.Property(e => e.Serialnumber).HasColumnName("serialnumber");
        });

        modelBuilder.Entity<City>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("cities_pkey");

            entity.ToTable("cities");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcountry).HasColumnName("idcountry");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdcountryNavigation).WithMany(p => p.Cities)
                .HasForeignKey(d => d.Idcountry)
                .HasConstraintName("cities_idcountry_fkey");
        });

        modelBuilder.Entity<Country>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("countries_pkey");

            entity.ToTable("countries");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Employmenttype>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("employmenttypes_pkey");

            entity.ToTable("employmenttypes");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Environment>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("environments_pkey");

            entity.ToTable("environments");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Foreignlanguage>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("foreignlanguages_pkey");

            entity.ToTable("foreignlanguages");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcountry).HasColumnName("idcountry");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdcountryNavigation).WithMany(p => p.Foreignlanguages)
                .HasForeignKey(d => d.Idcountry)
                .HasConstraintName("foreignlanguages_idcountry_fkey");
        });

        modelBuilder.Entity<Framework>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("frameworks_pkey");

            entity.ToTable("frameworks");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcategory).HasColumnName("idcategory");
            entity.Property(e => e.Idprogramminglanguage).HasColumnName("idprogramminglanguage");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdcategoryNavigation).WithMany(p => p.Frameworks)
                .HasForeignKey(d => d.Idcategory)
                .HasConstraintName("frameworks_idcategory_fkey");

            entity.HasOne(d => d.IdprogramminglanguageNavigation).WithMany(p => p.Frameworks)
                .HasForeignKey(d => d.Idprogramminglanguage)
                .HasConstraintName("frameworks_idprogramminglanguage_fkey");
        });

        modelBuilder.Entity<Hobby>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("hobbies_pkey");

            entity.ToTable("hobbies");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Profession>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("professions_pkey");

            entity.ToTable("professions");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Programminglanguage>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("programminglanguages_pkey");

            entity.ToTable("programminglanguages");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Programminglanguagecategory>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("programminglanguagecategories_pkey");

            entity.ToTable("programminglanguagecategories");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Programmingtool>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("programmingtools_pkey");

            entity.ToTable("programmingtools");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Skillsdomain>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("skillsdomain_pkey");

            entity.ToTable("skillsdomain");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Domain).HasColumnName("domain");
            entity.Property(e => e.Idparent).HasColumnName("idparent");
            entity.Property(e => e.Isfinal)
                .HasDefaultValueSql("1")
                .HasColumnName("isfinal");

            entity.HasOne(d => d.IdparentNavigation).WithMany(p => p.InverseIdparentNavigation)
                .HasForeignKey(d => d.Idparent)
                .HasConstraintName("skillsdomain_idparent_fkey");
        });

        modelBuilder.Entity<Softskill>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("softskills_pkey");

            entity.ToTable("softskills");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Tag>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("tags_pkey");

            entity.ToTable("tags");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Color).HasColumnName("color");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Workschedule>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("workschedule_pkey");

            entity.ToTable("workschedule");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
