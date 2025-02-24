using Microsoft.EntityFrameworkCore;
using MigrationsAssignment.Entities;

namespace MigrationsAssignment;

public class ApplicationDbContext : DbContext
{
    public DbSet<Course> Courses { get; set; }
    public DbSet<Enrollment> Enrollments { get; set; }
    public DbSet<Student> Students { get; set; }
    public DbSet<Instructor> Instructors { get; set; }
    public DbSet<Department> Departments { get; set; }
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        var folder = Environment.SpecialFolder.LocalApplicationData;
        var path = Environment.GetFolderPath(folder);
        optionsBuilder.UseSqlite($"Data Source={path}/student-management.db");
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Enrollment>()
            .HasOne(e=>e.Student)
            .WithMany()
            .HasForeignKey(e=>e.StudentId);
        modelBuilder.Entity<Enrollment>()
            .HasOne(e=>e.Course)
            .WithMany()
            .HasForeignKey(e=>e.CourseId);
        modelBuilder.Entity<Course>()
            .HasOne(e=>e.Instructor)
            .WithMany()
            .HasForeignKey(e=>e.InstructorId);
        modelBuilder.Entity<Department>()
            .HasOne(e=>e.DepartmentHead)
            .WithOne()
            .HasForeignKey<Department>(e=>e.DepartmentHeadId);
        
        base.OnModelCreating(modelBuilder);
    }
}