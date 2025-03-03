## Task 5
Rename the Grade attribute to FinalGrade in the Enrollment relation.
Argue why you have chosen destructive vs non-destructive approach to your schema changes.
---

We chose to do destructive changes on the database, but non-destructive changes from the 
application's point of view, meaning that we renamed the column in the database,
but the application could access the new column with the old name, as we used a reference property to access it.

This approach was chosen, because it is not invasive to the application, and the remaining parts of the application can
work without any changes. 

In terms of the destructive changes on the database, we chose to do them, as it was a simple change, and we found it redundant
to create a new column, and copy the values, which could cause a confusion in what column to use in the future, as they are essentially identical. 

```csharp
public class Enrollment
{
    public Guid Id { get; set; }
    public Guid StudentId { get; set; }
    public Student? Student { get; set; }
    public Guid CourseId { get; set; }
    public Course? Course { get; set; }
    public int? FinalGrade { get; set; } // Renamed attribute
    [NotMapped]
    public int? Grade { get=>FinalGrade; set=>FinalGrade=value; } // Reference to the renamed attribute
}
```

## Task 7
If you've chosen to use integers for the Credits attribute, modify the type to decimal(5, 2) and vice versa. Argue why you have chosen destructive vs non-destructive approach to your schema changes.

---

Here, it was also decided to use destructive changes on the database, but in a step-based approach. That means that first, we added a new column with the new type, 
and copied the values from the old column to the new column. Then, in the second step, we removed the old column, and finally, in the third step, we renamed the new column to the old name.
Then, in the down method, it is possible to reverse the changes, by adding the old column, copying the values (although now casted, so losing some precision), and removing the new column.

This approach was chosen to avoid data inconsistencies, as if we had both columns at the same time, it would be possible to have different values in the columns,
where the double type would have precise values, and the integer type would have rounded values, making it impossible to know which one is the correct one.