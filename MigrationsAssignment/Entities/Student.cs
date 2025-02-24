namespace MigrationsAssignment.Entities;

public class Student
{
    public Guid Id { get; set; }
    public required string FirstName { get; set; }
    public required string LastName { get; set; }
    public required string Email { get; set; }
    public DateTimeOffset Birthday { get; set; }
    public DateTimeOffset EnrollmentDate { get; set; }
}