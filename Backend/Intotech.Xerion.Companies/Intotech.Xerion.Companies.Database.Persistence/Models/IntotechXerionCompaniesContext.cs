using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Companies.Database.Persistence.Models;

public partial class IntotechXerionCompaniesContext : DbContext
{
    public IntotechXerionCompaniesContext()
    {
    }

    public IntotechXerionCompaniesContext(DbContextOptions<IntotechXerionCompaniesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Company> Companies { get; set; }

    public virtual DbSet<Companyimage> Companyimages { get; set; }

    public virtual DbSet<Companyoffice> Companyoffices { get; set; }

    public virtual DbSet<Companysocialmedialink> Companysocialmedialinks { get; set; }

    public virtual DbSet<Companytechnology> Companytechnologies { get; set; }

    public virtual DbSet<Jobadvertisement> Jobadvertisements { get; set; }

    public virtual DbSet<Jobapplication> Jobapplications { get; set; }

    public virtual DbSet<Jobcompaniesview> Jobcompaniesviews { get; set; }

    public virtual DbSet<Jobdetail> Jobdetails { get; set; }

    public virtual DbSet<Jobtechnology> Jobtechnologies { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Database=Intotech.Xerion.Companies;Username=postgres;Password=beatka");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Company>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("companies_pkey");

            entity.ToTable("companies");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Companyestablishment)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("companyestablishment");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Employeecount).HasColumnName("employeecount");
            entity.Property(e => e.Headquarteraddress).HasColumnName("headquarteraddress");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Logo).HasColumnName("logo");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Nip).HasColumnName("nip");
        });

        modelBuilder.Entity<Companyimage>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("companyimages_pkey");

            entity.ToTable("companyimages");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcompany).HasColumnName("idcompany");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdcompanyNavigation).WithMany(p => p.Companyimages)
                .HasForeignKey(d => d.Idcompany)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("companyimages_idcompany_fkey");
        });

        modelBuilder.Entity<Companyoffice>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("companyoffices_pkey");

            entity.ToTable("companyoffices");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcompany).HasColumnName("idcompany");
            entity.Property(e => e.Iframeurl).HasColumnName("iframeurl");
            entity.Property(e => e.Location).HasColumnName("location");

            entity.HasOne(d => d.IdcompanyNavigation).WithMany(p => p.Companyoffices)
                .HasForeignKey(d => d.Idcompany)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("companyoffices_idcompany_fkey");
        });

        modelBuilder.Entity<Companysocialmedialink>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("companysocialmedialinks_pkey");

            entity.ToTable("companysocialmedialinks");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcompany).HasColumnName("idcompany");
            entity.Property(e => e.Idsocialmedialink).HasColumnName("idsocialmedialink");
            entity.Property(e => e.Link).HasColumnName("link");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdcompanyNavigation).WithMany(p => p.Companysocialmedialinks)
                .HasForeignKey(d => d.Idcompany)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("companysocialmedialinks_idcompany_fkey");
        });

        modelBuilder.Entity<Companytechnology>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("companytechnologies_pkey");

            entity.ToTable("companytechnologies");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idcompany).HasColumnName("idcompany");
            entity.Property(e => e.Idtechnology).HasColumnName("idtechnology");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdcompanyNavigation).WithMany(p => p.Companytechnologies)
                .HasForeignKey(d => d.Idcompany)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("companytechnologies_idcompany_fkey");
        });

        modelBuilder.Entity<Jobadvertisement>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("jobadvertisements_pkey");

            entity.ToTable("jobadvertisements");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Companyid).HasColumnName("companyid");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Employmentmethod).HasColumnName("employmentmethod");
            entity.Property(e => e.Employmenttype).HasColumnName("employmenttype");
            entity.Property(e => e.Expirationdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("expirationdate");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Publicid).HasColumnName("publicid");
            entity.Property(e => e.Quizid).HasColumnName("quizid");
            entity.Property(e => e.Salarymax).HasColumnName("salarymax");
            entity.Property(e => e.Salarymin).HasColumnName("salarymin");

            entity.HasOne(d => d.Company).WithMany(p => p.Jobadvertisements)
                .HasForeignKey(d => d.Companyid)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("jobadvertisements_companyid_fkey");
        });

        modelBuilder.Entity<Jobapplication>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("jobapplications_pkey");

            entity.ToTable("jobapplications");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Cv).HasColumnName("cv");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idjobadvertisements).HasColumnName("idjobadvertisements");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdjobadvertisementsNavigation).WithMany(p => p.Jobapplications)
                .HasForeignKey(d => d.Idjobadvertisements)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("jobapplications_idjobadvertisements_fkey");
        });

        modelBuilder.Entity<Jobcompaniesview>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("jobcompaniesview");

            entity.Property(e => e.Companydescription).HasColumnName("companydescription");
            entity.Property(e => e.Companyemployeecount).HasColumnName("companyemployeecount");
            entity.Property(e => e.Companyestablishment)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("companyestablishment");
            entity.Property(e => e.Companyheadquarteraddress).HasColumnName("companyheadquarteraddress");
            entity.Property(e => e.Companyid).HasColumnName("companyid");
            entity.Property(e => e.Companyidaccount).HasColumnName("companyidaccount");
            entity.Property(e => e.Companylogo).HasColumnName("companylogo");
            entity.Property(e => e.Companyname).HasColumnName("companyname");
            entity.Property(e => e.Companynip).HasColumnName("companynip");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Jobcompanyid).HasColumnName("jobcompanyid");
            entity.Property(e => e.Jobdescription).HasColumnName("jobdescription");
            entity.Property(e => e.Jobemploymentmethod).HasColumnName("jobemploymentmethod");
            entity.Property(e => e.Jobemploymenttype).HasColumnName("jobemploymenttype");
            entity.Property(e => e.Jobexpirationdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("jobexpirationdate");
            entity.Property(e => e.Jobimage).HasColumnName("jobimage");
            entity.Property(e => e.Jobname).HasColumnName("jobname");
            entity.Property(e => e.Jobpublicid).HasColumnName("jobpublicid");
            entity.Property(e => e.Jobquizid).HasColumnName("jobquizid");
            entity.Property(e => e.Jobsalarymax).HasColumnName("jobsalarymax");
            entity.Property(e => e.Jobsalarymin).HasColumnName("jobsalarymin");
        });

        modelBuilder.Entity<Jobdetail>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("jobdetails_pkey");

            entity.ToTable("jobdetails");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Iddetail).HasColumnName("iddetail");
            entity.Property(e => e.Idjobadvertisements).HasColumnName("idjobadvertisements");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdjobadvertisementsNavigation).WithMany(p => p.Jobdetails)
                .HasForeignKey(d => d.Idjobadvertisements)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("jobdetails_idjobadvertisements_fkey");
        });

        modelBuilder.Entity<Jobtechnology>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("jobtechnologies_pkey");

            entity.ToTable("jobtechnologies");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Icon).HasColumnName("icon");
            entity.Property(e => e.Idjobadvertisements).HasColumnName("idjobadvertisements");
            entity.Property(e => e.Idtechnology).HasColumnName("idtechnology");

            entity.HasOne(d => d.IdjobadvertisementsNavigation).WithMany(p => p.Jobtechnologies)
                .HasForeignKey(d => d.Idjobadvertisements)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("jobtechnologies_idjobadvertisements_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
