using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MigrationsAssignment.Migrations
{
    /// <inheritdoc />
    public partial class AddFinalGradeDouble : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<double>(
                name: "FinalGradeDouble",
                table: "Enrollments",
                type: "REAL",
                nullable: true);

            migrationBuilder.Sql("UPDATE Enrollments SET FinalGradeDouble = FinalGrade");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.Sql("UPDATE Enrollments SET FinalGrade = CAST(FinalGradeDouble AS INTEGER)");
            
            migrationBuilder.DropColumn(
                name: "FinalGradeDouble",
                table: "Enrollments");
        }
    }
}
