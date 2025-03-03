namespace MigrationsAssignment.Entities;

public class Instructor
{
    public Guid Id { get; set; }
    public required string FirstName { get; set; }
    public string? MiddleName { get; set; }
    public required string LastName { get; set; }
    public required string Email { get; set; }
    public DateTimeOffset HireDate { get; set; }
}