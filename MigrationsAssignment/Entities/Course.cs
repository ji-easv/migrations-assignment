namespace MigrationsAssignment.Entities;

public class Course
{
    public Guid Id { get; set; }
    public required string Title { get; set; }
    public Guid InstructorId { get; set; }
    public Instructor? Instructor { get; set; }
    public int Credits { get; set; }
}