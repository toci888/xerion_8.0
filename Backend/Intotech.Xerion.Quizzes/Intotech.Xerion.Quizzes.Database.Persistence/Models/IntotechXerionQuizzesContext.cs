using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Intotech.Xerion.Quizzes.Database.Persistence.Models;

public partial class IntotechXerionQuizzesContext : DbContext
{
    public IntotechXerionQuizzesContext()
    {
    }

    public IntotechXerionQuizzesContext(DbContextOptions<IntotechXerionQuizzesContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Quiz> Quizzes { get; set; }

    public virtual DbSet<Quizzesanswer> Quizzesanswers { get; set; }

    public virtual DbSet<Quizzesattempt> Quizzesattempts { get; set; }

    public virtual DbSet<Quizzesquestion> Quizzesquestions { get; set; }

    public virtual DbSet<Quizzesresult> Quizzesresults { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseNpgsql("Host=localhost;Database=Intotech.Xerion.Quizzes;Username=postgres;Password=beatka");

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Quiz>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("quizzes_pkey");

            entity.ToTable("quizzes");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Idcompany).HasColumnName("idcompany");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Name).HasColumnName("name");
            entity.Property(e => e.Passingthreshold).HasColumnName("passingthreshold");
            entity.Property(e => e.Technology).HasColumnName("technology");
            entity.Property(e => e.Totalscore).HasColumnName("totalscore");
            entity.Property(e => e.Totaltime).HasColumnName("totaltime");
            entity.Property(e => e.Type).HasColumnName("type");
        });

        modelBuilder.Entity<Quizzesanswer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("quizzesanswers_pkey");

            entity.ToTable("quizzesanswers");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Additionaltext).HasColumnName("additionaltext");
            entity.Property(e => e.Answer).HasColumnName("answer");
            entity.Property(e => e.Idquestion).HasColumnName("idquestion");
            entity.Property(e => e.Idquiz).HasColumnName("idquiz");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Iscorrect).HasColumnName("iscorrect");
            entity.Property(e => e.Totalscore).HasColumnName("totalscore");
            entity.Property(e => e.Totaltime).HasColumnName("totaltime");

            entity.HasOne(d => d.IdquestionNavigation).WithMany(p => p.Quizzesanswers)
                .HasForeignKey(d => d.Idquestion)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesanswers_idquestion_fkey");

            entity.HasOne(d => d.IdquizNavigation).WithMany(p => p.Quizzesanswers)
                .HasForeignKey(d => d.Idquiz)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesanswers_idquiz_fkey");
        });

        modelBuilder.Entity<Quizzesattempt>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("quizzesattempts_pkey");

            entity.ToTable("quizzesattempts");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idquiz).HasColumnName("idquiz");
            entity.Property(e => e.Totalelapsedtime).HasColumnName("totalelapsedtime");
            entity.Property(e => e.Totalparticipantscore).HasColumnName("totalparticipantscore");

            entity.HasOne(d => d.IdquizNavigation).WithMany(p => p.Quizzesattempts)
                .HasForeignKey(d => d.Idquiz)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesattempts_idquiz_fkey");
        });

        modelBuilder.Entity<Quizzesquestion>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("quizzesquestions_pkey");

            entity.ToTable("quizzesquestions");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Additionaltext).HasColumnName("additionaltext");
            entity.Property(e => e.Idquiz).HasColumnName("idquiz");
            entity.Property(e => e.Image).HasColumnName("image");
            entity.Property(e => e.Question).HasColumnName("question");
            entity.Property(e => e.Totalscore).HasColumnName("totalscore");
            entity.Property(e => e.Totaltime).HasColumnName("totaltime");
            entity.Property(e => e.Type).HasColumnName("type");

            entity.HasOne(d => d.IdquizNavigation).WithMany(p => p.Quizzesquestions)
                .HasForeignKey(d => d.Idquiz)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesquestions_idquiz_fkey");
        });

        modelBuilder.Entity<Quizzesresult>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("quizzesresults_pkey");

            entity.ToTable("quizzesresults");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Answer).HasColumnName("answer");
            entity.Property(e => e.Elapsedtime).HasColumnName("elapsedtime");
            entity.Property(e => e.Idaccount).HasColumnName("idaccount");
            entity.Property(e => e.Idquiz).HasColumnName("idquiz");
            entity.Property(e => e.Idquizzesanswer).HasColumnName("idquizzesanswer");
            entity.Property(e => e.Idquizzesattempt).HasColumnName("idquizzesattempt");
            entity.Property(e => e.Score).HasColumnName("score");

            entity.HasOne(d => d.IdquizNavigation).WithMany(p => p.Quizzesresults)
                .HasForeignKey(d => d.Idquiz)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesresults_idquiz_fkey");

            entity.HasOne(d => d.IdquizzesanswerNavigation).WithMany(p => p.Quizzesresults)
                .HasForeignKey(d => d.Idquizzesanswer)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesresults_idquizzesanswer_fkey");

            entity.HasOne(d => d.IdquizzesattemptNavigation).WithMany(p => p.Quizzesresults)
                .HasForeignKey(d => d.Idquizzesattempt)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("quizzesresults_idquizzesattempt_fkey");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
