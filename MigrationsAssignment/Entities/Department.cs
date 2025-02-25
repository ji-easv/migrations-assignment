namespace MigrationsAssignment.Entities;

public class Department
{
    public Guid Id { get; set; }
    public string Name { get; set; }
    public string Budget { get; set; }
    public DateTimeOffset StartDate { get; set; }
    public Guid DepartmentHeadId { get; set; }
    public Instructor? DepartmentHead { get; set; }
}