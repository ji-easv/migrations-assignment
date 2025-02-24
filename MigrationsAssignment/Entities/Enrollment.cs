namespace MigrationsAssignment.Entities;

public class Enrollment
{
    public Guid Id { get; set; }
    public Guid StudentId { get; set; }
    public Guid CourseId { get; set; }
    public int? Grade { get; set; }
}