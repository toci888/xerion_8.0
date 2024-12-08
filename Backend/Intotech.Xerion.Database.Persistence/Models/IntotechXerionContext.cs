using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Database.Persistence.Models;

public partial class IntotechXerionContext : DbContext
{
    public IntotechXerionContext()
    {
    }

    public IntotechXerionContext(DbContextOptions<IntotechXerionContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Account> Accounts { get; set; }

    public virtual DbSet<Accountcoursescertificate> Accountcoursescertificates { get; set; }

    public virtual DbSet<Accounteducation> Accounteducations { get; set; }

    public virtual DbSet<Accountforeignlanguage> Accountforeignlanguages { get; set; }

    public virtual DbSet<Accountrole> Accountroles { get; set; }

    public virtual DbSet<Accountsocialmedialink> Accountsocialmedialinks { get; set; }

    public virtual DbSet<Accountsoftskill> Accountsoftskills { get; set; }

    public virtual DbSet<Accountsoftskillstitle> Accountsoftskillstitles { get; set; }

    public virtual DbSet<Accounttag> Accounttags { get; set; }

    public virtual DbSet<Accounttechnicalskill> Accounttechnicalskills { get; set; }

    public virtual DbSet<Accountworkexperience> Accountworkexperiences { get; set; }

    public virtual DbSet<Accountworkresponsibility> Accountworkresponsibilities { get; set; }

    public virtual DbSet<Emailsregister> Emailsregisters { get; set; }

    public virtual DbSet<Failedloginattempt> Failedloginattempts { get; set; }

    public virtual DbSet<Pushtoken> Pushtokens { get; set; }

    public virtual DbSet<Resetpassword> Resetpasswords { get; set; }

    public virtual DbSet<Role> Roles { get; set; }

    public virtual DbSet<Userextradatum> Userextradata { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Database=Intotech.Xerion;Username=postgres;Password=beatka");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Account>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accounts_pkey");

            entity.ToTable("accounts");

            entity.HasIndex(e => e.Email, "accounts_email_key").IsUnique();

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Allowsnotifications)
                .HasDefaultValueSql("false")
                .HasColumnName("allowsnotifications");
            entity.Property(e => e.Birthdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("birthdate");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Emailconfirmed)
                .HasDefaultValueSql("false")
                .HasColumnName("emailconfirmed");
            entity.Property(e => e.Employmentmethod).HasColumnName("employmentmethod");
            entity.Property(e => e.Employmenttype).HasColumnName("employmenttype");
            entity.Property(e => e.Idrole)
                .HasDefaultValueSql("1")
                .HasColumnName("idrole");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Lastmodificationdate)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("lastmodificationdate");
            entity.Property(e => e.Location).HasColumnName("location");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Password).HasColumnName("password");
            entity.Property(e => e.Phonenumber).HasColumnName("phonenumber");
            entity.Property(e => e.Refreshtoken).HasColumnName("refreshtoken");
            entity.Property(e => e.Refreshtokenvalid)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("refreshtokenvalid");
            entity.Property(e => e.Salarymax).HasColumnName("salarymax");
            entity.Property(e => e.Salarymin).HasColumnName("salarymin");
            entity.Property(e => e.Surname).HasColumnName("surname");
            entity.Property(e => e.Title).HasColumnName("title");
            entity.Property(e => e.Verificationcode).HasColumnName("verificationcode");
            entity.Property(e => e.Verificationcodevalid)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("verificationcodevalid");

            entity.HasOne(d => d.IdroleNavigation).WithMany(p => p.Accounts)
                .HasForeignKey(d => d.Idrole)
                .HasConstraintName("accounts_idrole_fkey");
        });

        modelBuilder.Entity<Accountcoursescertificate>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountcoursescertificates_pkey");

            entity.ToTable("accountcoursescertificates");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Certificateissuedate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("certificateissuedate");
            entity.Property(e => e.Certificatename).HasColumnName("certificatename");
            entity.Property(e => e.Certificatenumber).HasColumnName("certificatenumber");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Expirationdate)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("expirationdate");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idcertificate).HasColumnName("idcertificate");
            entity.Property(e => e.Idorganizationissuingcertificate).HasColumnName("idorganizationissuingcertificate");
            entity.Property(e => e.Organizationissuingcertificate).HasColumnName("organizationissuingcertificate");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accountcoursescertificates)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountcoursescertificates_idaccount_fkey");
        });

        modelBuilder.Entity<Accounteducation>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accounteducations_pkey");

            entity.ToTable("accounteducations");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Dateend)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("dateend");
            entity.Property(e => e.Datestart)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("datestart");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idprofession).HasColumnName("idprofession");
            entity.Property(e => e.Idprofessionaltitle).HasColumnName("idprofessionaltitle");
            entity.Property(e => e.Iduniversityname).HasColumnName("iduniversityname");
            entity.Property(e => e.Professionaltitle).HasColumnName("professionaltitle");
            entity.Property(e => e.Professionname).HasColumnName("professionname");
            entity.Property(e => e.Universityname).HasColumnName("universityname");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accounteducations)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accounteducations_idaccount_fkey");
        });

        modelBuilder.Entity<Accountforeignlanguage>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountforeignlanguages_pkey");

            entity.ToTable("accountforeignlanguages");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idforeignlanguage).HasColumnName("idforeignlanguage");
            entity.Property(e => e.Level).HasColumnName("level");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accountforeignlanguages)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountforeignlanguages_idaccount_fkey");
        });

        modelBuilder.Entity<Accountrole>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("accountroles");

            entity.Property(e => e.Allowsnotifications).HasColumnName("allowsnotifications");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Emailconfirmed).HasColumnName("emailconfirmed");
            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Password).HasColumnName("password");
            entity.Property(e => e.Refreshtoken).HasColumnName("refreshtoken");
            entity.Property(e => e.Refreshtokenvalid)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("refreshtokenvalid");
            entity.Property(e => e.Rolename).HasColumnName("rolename");
            entity.Property(e => e.Surname).HasColumnName("surname");
        });

        modelBuilder.Entity<Accountsocialmedialink>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountsocialmedialinks_pkey");

            entity.ToTable("accountsocialmedialinks");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idsocialmedialink).HasColumnName("idsocialmedialink");
            entity.Property(e => e.Link).HasColumnName("link");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accountsocialmedialinks)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountsocialmedialinks_idaccount_fkey");
        });

        modelBuilder.Entity<Accountsoftskill>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountsoftskills_pkey");

            entity.ToTable("accountsoftskills");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idaccountsoftskillstitle).HasColumnName("idaccountsoftskillstitle");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accountsoftskills)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountsoftskills_idaccount_fkey");

            entity.HasOne(d => d.IdaccountsoftskillstitleNavigation).WithMany(p => p.Accountsoftskills)
                .HasForeignKey(d => d.Idaccountsoftskillstitle)
                .HasConstraintName("accountsoftskills_idaccountsoftskillstitle_fkey");
        });

        modelBuilder.Entity<Accountsoftskillstitle>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountsoftskillstitles_pkey");

            entity.ToTable("accountsoftskillstitles");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Icon).HasColumnName("icon");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Accounttag>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accounttags_pkey");

            entity.ToTable("accounttags");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idtag).HasColumnName("idtag");
            entity.Property(e => e.Info).HasColumnName("info");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accounttags)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accounttags_idaccount_fkey");
        });

        modelBuilder.Entity<Accounttechnicalskill>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accounttechnicalskills_pkey");

            entity.ToTable("accounttechnicalskills");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Progress)
                .HasDefaultValueSql("0.00")
                .HasColumnName("progress");
            entity.Property(e => e.Type).HasColumnName("type");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accounttechnicalskills)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accounttechnicalskills_idaccount_fkey");
        });

        modelBuilder.Entity<Accountworkexperience>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountworkexperiences_pkey");

            entity.ToTable("accountworkexperiences");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Dateend)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("dateend");
            entity.Property(e => e.Datestart)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("datestart");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idprofession).HasColumnName("idprofession");
            entity.Property(e => e.Idworkcompany).HasColumnName("idworkcompany");
            entity.Property(e => e.Profession).HasColumnName("profession");
            entity.Property(e => e.Workcompany).HasColumnName("workcompany");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accountworkexperiences)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountworkexperiences_idaccount_fkey");
        });

        modelBuilder.Entity<Accountworkresponsibility>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("accountworkresponsibilities_pkey");

            entity.ToTable("accountworkresponsibilities");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idaccountworkexperience).HasColumnName("idaccountworkexperience");
            entity.Property(e => e.Name).HasColumnName("name");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Accountworkresponsibilities)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountworkresponsibilities_idaccount_fkey");

            entity.HasOne(d => d.IdaccountworkexperienceNavigation).WithMany(p => p.Accountworkresponsibilities)
                .HasForeignKey(d => d.Idaccountworkexperience)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("accountworkresponsibilities_idaccountworkexperience_fkey");
        });

        modelBuilder.Entity<Emailsregister>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("emailsregister_pkey");

            entity.ToTable("emailsregister");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Isverified)
                .HasDefaultValueSql("false")
                .HasColumnName("isverified");
            entity.Property(e => e.Verificationcode).HasColumnName("verificationcode");
        });

        modelBuilder.Entity<Failedloginattempt>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("failedloginattempts_pkey");

            entity.ToTable("failedloginattempts");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Kind).HasColumnName("kind");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Failedloginattempts)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("failedloginattempts_idaccount_fkey");
        });

        modelBuilder.Entity<Pushtoken>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("pushtokens_pkey");

            entity.ToTable("pushtokens");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Token).HasColumnName("token");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Pushtokens)
                .HasForeignKey(d => d.Idaccount)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("pushtokens_idaccount_fkey");
        });

        modelBuilder.Entity<Resetpassword>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("resetpassword_pkey");

            entity.ToTable("resetpassword");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Email).HasColumnName("email");
            entity.Property(e => e.Verificationcode).HasColumnName("verificationcode");
        });

        modelBuilder.Entity<Role>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("roles_pkey");

            entity.ToTable("roles");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Name).HasColumnName("name");
        });

        modelBuilder.Entity<Userextradatum>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("userextradata_pkey");

            entity.ToTable("userextradata");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Createdat)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("createdat");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Method).HasColumnName("method");
            entity.Property(e => e.Origin).HasColumnName("origin");
            entity.Property(e => e.Token).HasColumnName("token");
            entity.Property(e => e.Tokendatajson).HasColumnName("tokendatajson");

            entity.HasOne(d => d.IdaccountNavigation).WithMany(p => p.Userextradata)
                .HasForeignKey(d => d.Idaccount)
                .HasConstraintName("userextradata_idaccount_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
