using Microsoft.EntityFrameworkCore;
using MigrationsAssignment.Entities;

namespace MigrationsAssignment;

public class ApplicationDbContext : DbContext
{
    public DbSet<Course> Courses { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Student> Students { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var folder = Environment.SpecialFolder.LocalApplicationData;
        var path = Environment.GetFolderPath(folder);
        optionsBuilder.UseSqlite($"Data Source={path}/student-management.db");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Enrollment>()
            .HasOne(E=>E.Student)
            .WithMany()
            .HasForeignKey(E=>E.StudentId);
        modelBuilder.Entity<Enrollment>()
            .HasOne(E=>E.Course)
            .WithMany()
            .HasForeignKey(E=>E.CourseId);
        
        base.OnModelCreating(modelBuilder);
    }
}